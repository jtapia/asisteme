# == Schema Information
#
# Table name: addresses
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  line_1          :string
#  line_2          :string
#  state           :string
#  city            :string
#  zip_code        :string
#  country         :string
#  additional_info :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#

class Address < ActiveRecord::Base
  belongs_to :user
end
