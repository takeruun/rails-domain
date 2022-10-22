module UserDomain
  module Usecases
    class SignIn < ApplicationUsecase
      include InteractorTransactional

      organize Interactors::FindUserInteractor,
                Interactors::PasswordVerificationInteractor,
                Interactors::UpdateSessionInteractor
    end
  end
end