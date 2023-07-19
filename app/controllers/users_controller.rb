class UsersController < ApiController
  skip_before_action :authenticate_request, only: [:create]
  before_action :authenticate_request, only: %i[index update destroy ]
  before_action :check_admin, only: [:index]


  def index
    render json: Customer.all, status: :ok
  end

  def create
    user = if params[:type].downcase == 'admin'
      Admin.create(user_params)
    else
      Customer.create(user_params)
    end
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
      if @current_user.update(user_params)
        render json: @current_user, status: :ok
      else
        render json: { errors: @current_user.errors.full_messages },
        status: :unprocessable_entity
      end
  end

  def destroy
    if @current_user.present?
      @current_user.destroy
      render json: { message: "Account Deleted !! See you again #{@current_user} :( " }
    else
      render json: { error: "you are not valid user :(" }
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :location, :type)
  end

end
