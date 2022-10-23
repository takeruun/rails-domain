module UserDomain
  module Usecases
    class SignUp < ApplicationUsecase
      include InteractorTransactional

      organize Interactors::CreateUserInteractor,
               Interactors::StoreUserInteractor,
               Interactors::UpdateSessionInteractor
    end
  end
end
