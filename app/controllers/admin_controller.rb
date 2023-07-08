class AdminController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_admin, only: [:show, :destroy]

  # GET /users
  def index
    @admin = Admin.all
    render json: @admin, status: :ok
  end

  # GET /users/{username}
  # def show
  # 	admin = Admin.find_by_id(params[:id])
  # 	render json: @admin, status: :ok
  # end
  # POST /users
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      render json: @admin, status: :created
    else
      render json: { errors: @admin.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def show
    render json: Admin.find(params[:id])
  end

  def update
    unless @admin.update(admin_params)
      render json: { errors: @admin.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @admin.destroy
  end

  private

  def admin_params
    params.permit(:name, :email, :password)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end
end
