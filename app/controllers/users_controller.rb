class UsersController < ApiController
  skip_before_action :authenticate_request, only: [:create]
  before_action :authenticate_request, only: %i[index update destroy show]
  before_action :check_admin, only: [:index]
  before_action :set_users, only: %i[update destroy]

  def index
    render json: Customer.all, status: :ok
  end

  def create
    user = if params[:type].downcase == 'Admin'
      Admin.create(user_params)
    else
      Customer.create(user_params)
    end
    user = User.new(user_params)
    if user.save!
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages },
      status: :unprocessable_entity
    end
  rescue Exception => error
    render json: { error: error }, status: :unprocessable_entity
  end

  def update
    # byebug
    if @user.present?
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
      end
    else
      render json: { errors: "you are not valid user :(" }
    end
  end

  def destroy
    if @user.present?
      @user.destroy
      render json: { message: "user Deleted !! See you again #{@user} :( " }
    else
      render json: { error: "you are not valid user :(" }
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :location, :type)
  end

  def set_users
    @user = User.find(params[:id])
  end
end
