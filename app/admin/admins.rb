ActiveAdmin.register Admin do
actions :index , :show , :delete


index do
  selectable_column
  column :name
  column :email
  column :created_at
  column :location
  actions
end

filter :email
filter :current_sign_in_at
filter :sign_in_count
filter :created_at
filter :location

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :email, :password, :location, :type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password, :location, :type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
