class ServiceController < ApiController
  before_action :check_admin, only: %i[create update destroy]
  before_action :set_services, only: %i[update destroy]

  def index
    service = params[:service_name].blank? ? Service.all : Service.where("service_name LIKE ?", "%#{params[:service_name]}%")
    if service.length == 0
      render json: { message: "service_name not found :(" }
    else
      render json: service
    end
  end

  def create
    service = @current_user.services.new(service_params)
    # service.admin_id = @current_user.id
    if service.save!
      render json: service, status: :created
    else
      render json: { error: service.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def update
    # service = Service.find_by_id(params[:id])
    if @service
      if @service.update(service_params)
        render json: @service, status: :ok
      else
        render json: { error: @service.errors.full_messages },
        status: :unprocessable_entity
      end
    else
      render json: { error: "this service is not found :( " }
    end
  end

  def destroy
    # byebug
    # service = @current_user.services.find_by(id: params[:id])
    if @service
      @service.destroy
      render json: @service
    else
      render json: { error: " id not found :( " }
    end
  end

  private

  def service_params
    params.permit(:service_name, :location, :status, :image)
  end

  def set_services
    @service = Service.find_by_id(params[:id])
  end
end
