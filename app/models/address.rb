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
#  latitude        :float
#  longitude       :float
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#

class Address < ActiveRecord::Base
  belongs_to :user

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.address_has_changed? }

  def address_has_changed?
    changed? && address_information_present?
  end

  def address_information_present?
    line_1.present? &&
      line_2.present? &&
      state.present? &&
      country.present?
  end

  validates_presence_of :line_1,
                        :line_2,
                        :state,
                        :city,
                        :country,
                        if: Proc.new{ |address| address.user && address.user.is_nurse? }

  def full_address
    [line_1, line_2, city, state, country].compact.join(', ')
  end
end
