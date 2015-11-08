module UserHelper
  def setup_user(user)
    user.build_address if user.address.nil?
    user
  end
end

