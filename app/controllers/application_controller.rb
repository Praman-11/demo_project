class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request

  private

  def authenticate_request
    # byebug

    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = jwt_decode(header)
    # {user_id: ..., user_type: ...}
    @current_user = if decoded[:type] == 'Customer'
                      User.find(decoded[:customer_id])
                    else
                      Admin.find(decoded[:admin_id])
                    end
  rescue StandardError
    render json: { error: 'Unauthorized User' }, status: 400
  end

  def check_admin
  	if @current_user.type != 'Admin'

  		render json: { error: 'Customer Not Allowed ' }, status: 400
  	end
  end

  def check_customer
  	if @current_user.type != 'Customer'

  		render json: { error: ' Admin Not Allowed ' }, status: 400
  	end
  end

end
