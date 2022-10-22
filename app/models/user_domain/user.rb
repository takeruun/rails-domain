class UserDomain::User < ApplicationRecord
  has_many :todos

  class << self
    def store!(record)
      record.save!
    end
  end
end
