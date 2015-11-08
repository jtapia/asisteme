class AddAddressTable < ActiveRecord::Migration
  def change
    create_table(:addresses) do |t|
      t.integer   :user_id
      t.string    :line_1
      t.string    :line_2
      t.string    :state
      t.string    :city
      t.string    :zip_code
      t.string    :country
      t.string    :additional_info

      t.timestamps null: false
    end

    add_index :addresses, :user_id
  end
end