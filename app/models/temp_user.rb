class TempUser < ApplicationRecord
  include ActiveModel::Validations
  # token length
  TOKEN_LENGTH = 48

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :mail_address, presence: true
  validates :mail_address, mail_format: true, unless: Proc.new { |p| p.mail_address.blank? }
  validate :already_used_mail_address

  # validation
  # mail_addressがすでにusersで使用されている場合 エラーとする
  def already_used_mail_address
    unless User.find_by(mail_address: mail_address).nil?
      errors.add(:mail_address, I18n.t("validate.already_use"))
    end
  end

  class << self
    # 仮ユーザの作成
    def create_temp_user(params)
      # temp_usersにmail_addressで検索 初期化する
      temp_user = find_or_initialize_by(mail_address: params[:mail_address])
      temp_user.last_name = params[:last_name]
      temp_user.first_name = params[:first_name]
      temp_user.token = create_token
      temp_user.expired_at = DateTime.now + 1
      return temp_user
    end

    def get_active_temp_user(token)
      temp_users = TempUser.where(token: token).where(TempUser.arel_table[:expired_at].gt DateTime.now).limit(1)
      return temp_users[0]
    end

    # token生成
    # 生成後 temp_usersで使用されている場合 再生成する
    def create_token
      token = nil
      loop do
        token = SecureRandom.urlsafe_base64(TOKEN_LENGTH)
        break if TempUser.find_by(token: token).nil?
      end
      return token
    end
  end
end
