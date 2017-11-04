ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :uid

  filter :email
  filter :uid

  index do
    selectable_column
    column :email
    column :uid
    column :status do |user|
      user.hs_sessions.last.try(:status) || "OUT"
    end

    column :sessions_count do |user|
      user.hs_sessions_count
    end

    actions
  end

  form do |f|
    f.inputs "The stuff..." do
      f.input :email
      f.input :uid
    end
    para "Press cancel to return to the list without saving."
    actions
  end
end
