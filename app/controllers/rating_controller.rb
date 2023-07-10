class RatingController < ApplicationController
  before_action :check_customer, only: [:create,:search_city_wise,:search_nearby_location,:sort_listing_service_on_rating,:filter_services_on_rating]

  def create
    # byebug
    # begin
      new_rating = @current_user.ratings.new(rating_params)
    if new_rating.save
      update_rating(params[:service_id])
      render json: new_rating, status: :ok
    else
      render json: { errors: new_rating.errors.full_messages },
             status: :unprocessable_entity
    end
  # rescue Exception => e
  #   render json: {error: e.to_s}
  # end
  end

  def search_city_wise
    if params[:location]
      @service = Service.where("location LIKE ?", "%#{params[:location]}%")
      render json: @service
    else
      render json: { error: "Can't find location" },
             status: :unprocessable_entity
    end
  end

  def search_nearby_location
    @service = Service.where(location: @current_user.location)
    render json: @service
  end

  def sort_listing_service_on_rating
    services = Service.order(avg_rating: :desc)
    render json: services
  end

  def filter_services_on_rating
    if params[:rating]
      services = Service.where(avg_rating: params[:rating])
      render json: services
    else
      render json: { error: "can't find rating" }
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
