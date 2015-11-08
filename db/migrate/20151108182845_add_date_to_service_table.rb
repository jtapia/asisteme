class AddDateToServiceTable < ActiveRecord::Migration
  def change
    add_column :services, :specialty, :string
    add_column :services, :start_date, :datetime
    add_column :services, :end_date, :datetime
  end
end
