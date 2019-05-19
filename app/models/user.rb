class User < ApplicationRecord
    include ActiveModel::Validations
    has_secure_password validations: true

    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_roman, upper_case_format: true, unless: Proc.new { |p| p.last_name_roman.blank? }
    validates :first_name_roman, upper_case_format: true, unless: Proc.new { |p| p.first_name_roman.blank? }
    validates :sex, inclusion: { in: [0, 1] }
    validates :birthed_on, presence: true
    validates :mail_address, uniqueness: true
    validates :password, password_format: true
    validate :already_used_mail_address

    # already used mail address
    def already_used_mail_address
        unless User.find_by(mail_address: mail_address).nil?
            errors.add(:mail_address, I18n.t('validate.already_use'))
        end
    end

    # create remember token
    def self.create_remember_token
        SecureRandom.urlsafe_base64
    end

    # encrypt
    def self.encrypt(token)
        Digest::SHA256.hexdigest(token.to_s)
    end

end


