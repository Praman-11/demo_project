class ServiceController < ApplicationController
	def index
		@services = Service.where("search_name like %#{params[:query]}%")
	end

	
	def create

		@service = Service.new(service_params)
		@service.admin_id = @current_user.id
		if @service.save
			render json: @service, status: :created
		else
			render json: {error: @service.errors.full_messages},
			status: :unprocessable_entity
		end
	end

	def show
		render json: Service.find(params[:id])
	end
	

	def update
		@service =  Service.find(params[:id])
			if @service.update(service_params)
			render json: @service, status: :ok
		else
			render json: {error: @service.errors.full_messages},
				status: :unprocessable_entity
		end
	end

	private
	 def service_params
	 	params.permit(:service_name, :location, :status)
	 end

end
