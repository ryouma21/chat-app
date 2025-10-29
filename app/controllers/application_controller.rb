class ApplicationController < ActionController::Base
  # アプリ全体の基底コントローラ。
  # ここに記述したフィルタや設定は、全てのコントローラに適用されます。

  # すべてのアクションでログインを必須化（Devise）。
  # 未ログインの場合はサインインページへリダイレクトされます。
  before_action :authenticate_user!

  # Devise のコントローラ（サインアップ/ログイン/更新など）のときだけ
  # 受け付けるパラメータを拡張するコールバックを実行します。
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # Devise におけるストロングパラメータの追加許可設定。
  # サインアップ時に :name を受け取れるようにします。
  # 例: 更新時にも許可したい場合は
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  # のように追記します。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
