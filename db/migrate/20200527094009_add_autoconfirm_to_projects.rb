class AddAutoconfirmToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :autoconfirm, :boolean, default: false
  end
end
