class AdminAuthenticationController < ApplicationController
  skip_before_action :authenticate_request

	def login
		@admin = Admin.find_by(email: params[:email], password: params[:password])
		if @admin
			token = jwt_encode({admin_id: @admin.id, type: @admin.type})
			render json: {token: token}, status: :ok
		else
			render json: {error: 'unauthorized admin'}, status: :unauthorized
		end
	end

end
