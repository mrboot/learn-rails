class VisitorsController < ApplicationController

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      flash[:alert] = "Sorry, there was an issue you signing you up. PLease try again"
      render :new
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end

end
