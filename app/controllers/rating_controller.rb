class RatingController < ApplicationController
  before_action :check_customer, only: [:create,:search_city_wise,:search_nearby_location,:sort_listing_service_on_rating,:filter_services_on_rating]

  def create
      new_rating = @current_user.ratings.new(rating_params)
    if new_rating.save
      update_rating(params[:service_id])
      render json: new_rating, status: :ok
    else
      render json: { errors: new_rating.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def search_city_wise
     
    if !params[:location].blank? 
      @service = Service.where("location LIKE ?", "%#{params[:location]}%")
      if  @service.find_by(location: params[:location])   
      render json: @service
      else
      render json: { error: "Can't find location" },
             status: :unprocessable_entity
      end
    else
    render json: {error: 'location is blank'}
    end
  end

  def search_nearby_location
    # byebug
    @service = Service.where(location: @current_user.location)
    if @service.length == 0
      render json: { error: "Can't find services in this location :(" }
    else
    render json: @service
    end
  end


  def sort_listing_service_on_rating
    services = Service.order(avg_rating: :desc)
    render json: services
  end

  def filter_services_on_rating
    if !params[:rating].blank?
      services = Service.where(avg_rating: params[:rating])
      if services.find_by(avg_rating: params[:rating])
      render json: services
      else
      render json: { error: "cant find this type rating :(" }
      end
    else
      render json: {error:"rating is blank :( "}
    end
  end

  private

  def rating_params
    params.permit(:feedback, :rating, :service_id)
  end

  def update_rating(id)
    # byebug
    service = Service.find(id)
    ids = service.ratings.pluck(:rating)
    total = 0
    count = 0
    ids.each do |i|
      total = total + i
      count += 1
    end
    avg_rating = total / count
    service.update(avg_rating: avg_rating)
  end
end
