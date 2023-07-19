class ApiController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  rescue StandardError
    render json: { error: "Unauthorized User" }, status: 400
  end

  def check_admin
    if @current_user.type != "Admin"
      render json: { error: "Customer Not Allowed " }, status: 400
    end
  end

  def check_customer
    if @current_user.type != "Customer"
      render json: { error: " Admin Not Allowed " }, status: 400
    end
  end

  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end
end
