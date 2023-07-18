# class CustomerController < ApiController
#   skip_before_action :authenticate_request, only: [:create]
#   before_action :check_admin, only: %i[index show]
#   before_action :check_customer, only: %i[update destroy]

#   def index
#     render json: Customer.all, status: :ok
#   end

#   def create
#     customer = Customer.new(customer_params)
#     if customer.save
#       render json: customer, status: :created
#     else
#       render json: { errors: customer.errors.full_messages },
#              status: :unprocessable_entity
#     end
#   end

#   def show
#     render json: Customer.find(params[:id])
#   end

#   def update
#     # byebug
#     customer = Customer.where(id: @current_user.id).find_by(id: params[:id])
#     if customer.present?
#       if customer.update(customer_params)
#         render json: customer, status: :ok
#       else
#         render json: { errors: customer.errors.full_messages },
#                status: :unprocessable_entity
#       end
#     else
#       render json: { errors: "you are not valid customer :(" }
#     end
#   end

#   def destroy
#     customer = Customer.where(id: @current_user.id).find_by(id: params[:id])
#     if customer.present?
#       customer.destroy
#       render json: { message: "Customer Deleted !! See you again :( " }
#     else
#       render json: { error: "you are not valid customer :(" }
#     end
#   end

#   private

#   def customer_params
#     params.permit(:name, :email, :password, :location)
#   end
# end
