class ServiceController < ApplicationController

	def show_service
		@service = Service.where("service_name LIKE ?", "%#{params[:service_name]}%")
		render json: @service
	end

	def index
		@service = Service.all
		render json: @service
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

	def destroy
		@service  =  Service.find(params[:id])
		@service.destroy
		render json: @service 
	end	

	private
	 def service_params
	 	params.permit(:service_name, :location, :status)
	 end

end
