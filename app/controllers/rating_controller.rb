class RatingController < ApiController
  before_action :check_customer

  def create
    new_rating = @current_user.ratings.new(rating_params)
    if new_rating.save
      render json: new_rating, status: :ok
    else
      render json: { errors: new_rating.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.permit(:feedback, :rating, :service_id)
  end
end
