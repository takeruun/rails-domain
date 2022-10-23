class UserDomain::User < ApplicationRecord
  has_many :todos, dependent: :destroy

  class << self
    def store!(record)
      record.save!
    end
  end
end
