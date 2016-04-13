ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  permit_params :name, :price, :color, :photo, category_ids: []

form do |f|
    f.inputs "Project Details" do
      f.input :name
      f.input :price
      f.input :color
      f.input :photo, :as => :file
      f.input :categories
      # Will preview the image when the object is edited
    end
    f.actions
  end


end
