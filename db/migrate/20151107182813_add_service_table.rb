class AddServiceTable < ActiveRecord::Migration
  def change
    create_table(:services) do |t|
      t.integer   :customer_id
      t.integer   :nurse_id
      t.text      :description
      t.text      :comments
      t.float     :price
      t.integer   :rating
      t.string    :state

      t.timestamps null: false
    end

    add_index :services, :customer_id
    add_index :services, :nurse_id
  end
end
