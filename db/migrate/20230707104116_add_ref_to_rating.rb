class AddRefToRating < ActiveRecord::Migration[7.0]
  def change
    add_reference :ratings, :service
    add_reference :ratings, :customer
  end
end
