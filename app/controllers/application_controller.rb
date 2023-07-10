class ApplicationController < ActionController::API
	include JsonWebToken

	before_action :authenticate_request
	private
	def authenticate_request
			# byebug
			begin
				header = request.headers["Authorization"]
				header = header.split(" ").last if header
				decoded = jwt_decode(header)
				# {user_id: ..., user_type: ...}
				if decoded[:type] == "Customer"
					@current_user = User.find(decoded[:customer_id])
				else
					@current_user = Admin.find(decoded[:admin_id])
				end
			rescue
				render json: {error: "Unauthorized User"}, status: 400
			end
		end
		def check_admin
			# byebug
			if @current_user.type != 'Admin'
				render json: {error: "Customer Not Allowed "}, status: 400
			end
		end
		def check_customer
			if @current_user.type != 'Customer'
				render json: {error: " Admin Not Allowed "}, status: 400
			end
		end
	end
