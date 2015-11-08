class Service < ActiveRecord::Base
  belongs_to :customer, foreign_key: 'customer_id'
  belongs_to :nurse, foreign_key: 'nurse_id'
end
