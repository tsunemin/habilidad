class UpperCaseFormatValidator < ActiveModel::EachValidator
    VALID_UPPER_CASE_REGEX = /[A-Z]+/

    def validate_each(record, attribute, value)
        record.errors.add(attribute, I18n.t('validate.format')) unless value =~ VALID_UPPER_CASE_REGEX
    end
end