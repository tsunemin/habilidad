class Session
  # テーブルなしのModel
  include ActiveModel::Model

  # アクセサの生成
  attr_accessor :mail_address, :password

  # バリデーション
  validates :mail_address, presence: true
  validates :password, presence: true

  # 認証失敗
  def sign_in_failure
    # モデルのエラーメッセージを追加する
    errors[:base] << I18n.t("activemodel.errors.session.sign_in_failure")
  end
end
