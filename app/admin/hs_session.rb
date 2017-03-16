ActiveAdmin.register HsSession do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  #

  index do
    column :id
    column :user
    column :timein
    column :timeout
    column :diff
    column :status
    column :auto_signed_out

    actions
  end


end
