ActiveAdmin.register HsSession do

  filter :user_email, as: :string
  filter :user_uid, as: :string

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
