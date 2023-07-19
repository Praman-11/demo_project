class ServiceController < ApiController
  before_action :check_admin, only: %i[create update destroy]
  before_action :check_customer, only: [:index]

  def index
    service = Service.all

    service = service.where(location: @current_user.location) if params[:near_location]
    
    service = service.where(avg_rating: params[:rating]) if params[:rating].present?
    
    service = service.order(avg_rating: :desc) if params[:avg_rating].present?
    
    service = service.where("location LIKE ?", "%#{params[:location]}%") if params[:location].present?
    
    service = service.where(" service_name LIKE ? ", "%#{params[:service_name]}%" ) if params[:service_name].present?

    render json: service
  end

  def create
    service = @current_user.services.new(service_params)
    if service.save!
      render json: service, status: :created
    else
      render json: { error: service.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def update
    service = @current_user.services.find_by(id:params[:id]) if params[:id]
    if service.update(service_params)
      render json: service, status: :ok
    end
    render json: { error: service.errors.full_messages },
    status: :unprocessable_entity
  end

  def destroy
    if service = @current_user.services.find_by(id:params[:id])
      service.destroy
      render json: {message: "service Deleted successfully see you again :("}
    else
      render json: { error: " id not found :( " }
    end
  end

  private

  def service_params
    params.permit(:service_name, :location, :status, :image)
  end

end
