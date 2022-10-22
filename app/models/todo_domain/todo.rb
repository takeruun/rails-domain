class TodoDomain::Todo < ApplicationRecord
  belongs_to :user_id

  class << self
    def store!(record)
      record.save!
    end
  end
end
