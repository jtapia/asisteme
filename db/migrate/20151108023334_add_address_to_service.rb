class AddAddressToService < ActiveRecord::Migration
  def change
    add_column :services, :address_id, :integer
    add_index :services, :address_id
  end

end
