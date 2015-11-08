class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", mini: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # callbacks
  after_create :set_default_user_type

  has_one :address

  def full_name
    "#{first_name} #{last_name}"
  end

  private

    def set_default_user_type
      self.update_column(:type, 'Customer') unless self.type
    end
end
