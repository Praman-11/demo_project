ActiveAdmin.register Service do
  actions :index, :show 

index do
  selectable_column
  column :service_id
  column :service_name
  column :status
  column :location
  column :created_at
  column :updated_at

  actions
end

filter :service_id
filter :service_name
filter :status


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :service_name, :location, :status, :admin_id, :avg_rating
  #
  # or
  #
  # permit_params do
  #   permitted = [:service_name, :location, :status, :admin_id, :avg_rating]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
