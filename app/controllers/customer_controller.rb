class CustomerController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_customer, only: [ :destroy, :update ]
  before_action :check_admin, only: [:index, :show]
  before_action :check_customer, only: [ :update, :destroy]

  def index

    @customer = Customer.all
    render json: @customer, status: :ok
 end

  def create
    @customer = Customer.new(customer_params)
    # @customer.customer_id = current_user.id
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
    # byebug
    @customer = Customer.where(id: @current_user.id).find_by(id: params[:id])
    if @customer.present?
      if @customer.update(customer_params)
        render json: @customer, status: :ok
      else
        render json: { errors: @customer.errors.full_messages },
        status: :unprocessable_entity
      end
    else
      render json: { errors: "you are not valid customer :("}
    end
  end

  def destroy
     @customer = Customer.where(id: @current_user.id).find_by(id: params[:id])
     if @customer.present?
      @customer.destroy
      render json: { message: "Customer Deleted" }
    else
      render json: {error: "you are not valid customer :("}
    end
  end

  private

  def customer_params
    params.permit(:name, :email, :password, :location)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
