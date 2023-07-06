class AddRefOfAdminToService < ActiveRecord::Migration[7.0]
  def change
    add_reference :services, :admin
  end
end
