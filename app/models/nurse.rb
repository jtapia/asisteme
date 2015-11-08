# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  type                   :string
#  first_name             :string
#  last_name              :string
#  state                  :string
#  phone                  :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  form                   :string
#  bio                    :text
#  start_date             :datetime
#  end_date               :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class Nurse < UserParty

  has_many :services

  validates_presence_of :form, on: :update

  #validates_attachment_presence :avatar, on: :update

  state_machine initial: :pending do

    event :complete do
      transition pending: :completed
    end

    event :approve do
      transition completed: :approved
    end

  end
end

