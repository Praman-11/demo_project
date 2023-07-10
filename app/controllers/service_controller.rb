class ServiceController < ApplicationController

	before_action :check_admin, only: [ :create,:show_service, :show, :update, :destroy]
	before_action :check_customer, only: [:index ]
	def show_service
		if params[:service_name].blank?
			render json: {error: "empty service_name :("}
		else
			@service = Service.where("service_name LIKE ?", "%#{params[:service_name]}%")
			if @service.length
				render json: @service
			else
				render json: {error:"Please Enter search_name :( "}
			end
		end
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

	def update
		@service =  Service.find_by_id(params[:id])
		if !@service
			if @service.update(service_params)
				render json: @service, status: :ok
			else
				render json: {error: @service.errors.full_messages},
				status: :unprocessable_entity
			end
		else
			render json: {error: "this service is not found :( "}
		end
	end

	def destroy
		# byebug
		@service = @current_user.services.find_by(id: params[:id])
		if @service 
			@service.destroy
			render json: @service 
		else
			render json: {error: " id not found :( "}
		end
	end	


	private
	def service_params
		params.permit(:service_name, :location, :status)
	end

end
