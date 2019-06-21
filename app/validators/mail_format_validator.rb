class MailFormatValidator < ActiveModel::EachValidator
  VALID_MAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def validate_each(record, attribute, value)
    record.errors.add(attribute, I18n.t("validate.format")) unless value =~ VALID_MAIL_REGEX
  end
end
