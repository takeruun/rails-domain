module InteractorTransactional
  extend ActiveSupport::Concern

  included do
    around do |interactor|
      interactor.call

      raise ActiveRecord::Rollback if context.failure?
    end
  end
end
