# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  nurse_id    :integer
#  description :text
#  comments    :text
#  price       :float
#  rating      :integer
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_services_on_customer_id  (customer_id)
#  index_services_on_nurse_id     (nurse_id)
#

class Service < ActiveRecord::Base
  belongs_to :customer, foreign_key: 'customer_id'
  belongs_to :nurse, foreign_key: 'nurse_id'
  belongs_to :address

  state_machine :state, initial: :pending do
    event :accept do
      transition [:pending, :dealing] => :accepted
    end

    event :reject do
      transition pending: :rejected
    end

    event :deal do
      transition pending: :dealing
    end

    event :cancel do
      transition accepted: :canceled
    end

    event :complete do
      transition accepted: :completed
    end
  end
end
