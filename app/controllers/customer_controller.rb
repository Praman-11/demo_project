class CustomerController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_customer, only: [:show, :destroy]

  # GET /customer
  def index
    @customer = Customer.all
    render json: @customer, status: :ok
  end

  # GET /customer/{username}
  # def show
  # 	render json: @customer, status: :ok
  # end
  # POST /customer
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :created
    else
      render json: { errors: @customer.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    render json: Customer.find(params[:id])
  end

  def update
    unless @customer.update(user_params)
      render json: { errors: @customer.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    customer = Customer.find_by_id(params[:id])
    customer.destroy
    render json: { message: "Customer Deleted" }
  end

  private

  def customer_params
    params.permit(:name, :email, :password, :location)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
