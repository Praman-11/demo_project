class UserAuthenticationController < ApiController
  skip_before_action :authenticate_request

  def login
    user = User.find_by(email: params[:email], password: params[:password])
    if user
      token = jwt_encode({ user_id: user.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: "unauthorized user" }, status: :unauthorized
    end
  end
end
