module Modules
  module UserExtender

    USER_TYPES = %w(
      nurse
      customer
    )

    def define_user_types
      USER_TYPES.each do |user_type|
        define_method "is_#{user_type}?" do
          self.type == user_type.camelize
        end
      end
    end
  end
end
