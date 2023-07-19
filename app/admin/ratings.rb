ActiveAdmin.register Rating do
  actions :index, :show  

index do
  selectable_column
  column :service_id
  column :rating
  column :feedback
  column :created_at
  column :updated_at
  actions
end

filter :rating
filter :feedback


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :rating, :feedback, :service_id, :customer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:rating, :feedback, :service_id, :customer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
