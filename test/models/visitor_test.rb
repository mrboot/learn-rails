require 'test_helper'

describe Visitor do

  let(:visitor_params) { {email: 'user@example.com'} }
  let(:visitor) { Visitor.new visitor_params }

  it 'is valid when created with valid parameters' do
    visitor.must_be :valid?
  end

  it 'is invalid without an email' do
    # delete email before visitor is called
    visitor_params.delete :email
    visitor.wont_be :valid? #must not be valid without email
    visitor.errors[:email].must_be :present? # must have an error for missing email
  end

end
