class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'text/xml' }

  # GET /baskets
  # GET /baskets.json
  def index
    @baskets = Basket.all
  end

  # GET /baskets/1
  # GET /baskets/1.json
  def show
  end

  # GET /baskets/new
  def new
    @basket = Basket.new
  end

  # GET /baskets/1/edit
  def edit
  end

  def genxml

    xml = request.body.read
    @raw_xml = xml
    @bskt_resp = Hash.from_xml(xml)

    # UserMailer.basket_response_email(@bskt_resp).deliver

    if @bskt_resp.has_key?("NotificationMessage")
      if @bskt_resp["NotificationMessage"]["ListItems"]["ListItem"].is_a?(Array)
        UserMailer.full_basket_response_email(@bskt_resp).deliver
      else
        UserMailer.single_basket_response_email(@bskt_resp).deliver
      end
    else
      UserMailer.item_response_email(@bskt_resp).deliver
    end

    respond_to do |format|
      format.xml
    end
  end

  # POST /baskets
  # POST /baskets.json
  def create
    @basket = Basket.new(basket_params)

    xml = request.body.read
    @bskt_resp = Hash.from_xml(xml)

    respond_to do |format|
      # if @basket.save
      #   format.html { redirect_to @basket, notice: 'Basket was successfully created.' }
      #   format.json { render :show, status: :created, location: @basket }
      # else
        format.html { render :new }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
        format.xml  { render xml: @bskt_resp }
        # format.xml  { render :new }
      # end
    end
  end

  # PATCH/PUT /baskets/1
  # PATCH/PUT /baskets/1.json
  def update
    respond_to do |format|
      if @basket.update(basket_params)
        format.html { redirect_to @basket, notice: 'Basket was successfully updated.' }
        format.json { render :show, status: :ok, location: @basket }
      else
        format.html { render :edit }
        format.json { render json: @basket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baskets/1
  # DELETE /baskets/1.json
  def destroy
    @basket.destroy
    respond_to do |format|
      format.html { redirect_to baskets_url, notice: 'Basket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basket
      @basket = Basket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basket_params
      params[:basket]
    end
end
