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
;  end
end
