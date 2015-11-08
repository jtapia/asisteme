class UserParty < User
  has_many :services

  validates_presence_of :first_name,
                        :last_name,
                        :phone

  state_machine initial: :pending do

    event :complete do
      transition pending: :completed
    end

    event :approve do
      transition completed: :approved
    end

  end
end
