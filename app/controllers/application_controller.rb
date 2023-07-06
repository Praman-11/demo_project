class ApplicationController < ActionController::API
	include JsonWebToken

	before_action :authenticate_request
	private
		def authenticate_request
			header = request.headers["Authorization"]
			header = header.split(" ").last if header
			decoded = jwt_decode(header)
			# byebug
			# {user_id: ..., user_type: ...}
			if decoded[:type] == "customer"
				@current_user = User.find(decoded[:customer_id])
			else
				@current_user = Admin.find(decoded[:admin_id])
			end
		end
end
