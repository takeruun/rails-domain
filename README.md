# About
Usecase/Interactor を利用した Rails-DDD Todo アプリケーション

## Interactorオブジェクト
Interactorオブジェクトとは「**デザインパターンのひとつで、ビジネスロジックをカプセル化するためのモデル層に属するクラス群**」。

ひとつのInteractorオブジェクトはひとつの責務をもつ。

※「ひとつの責務」とは、たとえば「記事を投稿する」「決済を行う」という、それ以上分割できない責務。

下記は、「ユーザーを見つける」Interactor です。
```ruby
module UserDomain
  module Usecases
    module Interactors
      class FindUserInteractor < ApplicationInteractor
        delegate :params, to: :context, private: true

        def call
          user = Models::User.find_by(email: params[:email])
          
          if user.nil?
            context.fail!(message: 'ユーザーが見つかりません。')
          else
            context[:user] = user
          end
        end

      end
    end
  end
end
```

## Usecaseオブジェクト
Usecaseオブジェクトとは複数のInteractorを構成するクラスです。

「ユーザーを見つける」「パスワードを検証する」「セッションに保存する」の Interactor の使用を定義します。
```ruby
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
```


**参考サイト**
- https://applis.io/posts/rails-design-pattern-interactor-objects