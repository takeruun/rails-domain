module UserDomain
  module Models
    class User < ApplicationRecord
      include ActiveModel::SecurePassword
      has_secure_password
    end
  end
end
