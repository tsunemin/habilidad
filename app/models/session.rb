class Session
    # テーブルなしのModel
    include ActiveModel::Model

    # アクセサの生成
    attr_accessor :mail_address, :password

    # バリデーション
    validates :mail_address, presence: true
    validates :password, presence: true
end