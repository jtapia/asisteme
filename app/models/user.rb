class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # callbacks
  after_create :set_default_user_type

  has_one :address

  private

    def set_default_user_type
      self.update_column(:type, 'Customer') unless self.type
    end
end
