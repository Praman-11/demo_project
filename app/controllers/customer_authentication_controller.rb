class CustomerAuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @customer = Customer.find_by(email: params[:email], password: params[:password])
    if @customer
      token = jwt_encode({ customer_id: @customer.id, type: @customer.type })
      render json: { token: token }, status: :ok
    else
      render json: { error: "unauthorized person" }, status: :unauthorized
    end
  end
end
