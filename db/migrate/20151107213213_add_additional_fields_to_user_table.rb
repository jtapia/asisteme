class AddAdditionalFieldsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :state, :string
    add_column :users, :phone, :string
    add_attachment :users, :avatar
    add_column :users, :form, :string
    add_column :users, :bio, :text
  end
end
