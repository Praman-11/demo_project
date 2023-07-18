# class AdminController < ApiController
#   skip_before_action :authenticate_request, only: [:create]
#   before_action :check_admin, only: %i[show update destroy]

#   def create
#     admin = Admin.new(admin_params)
#     if admin.save
#       render json: admin, status: :created
#     else
#       render json: { errors: admin.errors.full_messages },
#              status: :unprocessable_entity
#     end
#   end

#   def show
#     render json: Admin.find(params[:id])
#   end

#   def update
#     admin = Admin.where(id: @current_user.id).find_by(id: params[:id])
#     if admin.present?
#       if admin.update(admin_params)
#         render json: admin, status: :ok
#       else
#         render json: { errors: admin.errors.full_messages },
#                status: :unprocessable_entity
#       end
#     else
#       render json: { error: 'you are not valid admin :(' }
#     end
#   end

#   def destroy
#     admin = Admin.where(id: @current_user.id).find_by(id: params[:id])
#     if admin.present?
#       admin.destroy
#       render json: { error: 'admin deleted :(' }
#     else
#       render json: { error: 'you are not valid admin :(' }
#     end
#   end

#   private

#   def admin_params
#     params.permit(:name, :email, :password)
#   end

# end
