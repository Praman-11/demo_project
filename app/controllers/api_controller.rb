class ApiController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {warning: exception}
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: { warning: exception}
  end

  def current_user
    @current_user
  end

  private

  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  rescue StandardError
    render json: { error: "Unauthorized User" }, status: 400
  end

  before_action do
    ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  end
end
