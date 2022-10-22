class TodoDomain::Todo < ApplicationRecord
  belongs_to :user_id
end
