class PasswordFormatValidator < ActiveModel::EachValidator

    ## password format validate
    ## * 8 characters or more.
    ## * use 3 to 4 types of characters.
    ##   * lower case alphabet.
    ##   * upper case alphabet.
    ##   * number.
    ##   * symbol[!@#$%]
    VALID_PASSWORD_REGEX = /((?=.{8,})(?=.*\d+.*)(?=.*[A-Z]+.*).*[!@#$%]+.*)|((?=.{8,})(?=.*\d+.*)(?=.*[a-z]+.*).*[!@#$%]+.*)|((?=.{8,})(?=.*[a-z]+.*)(?=.*[A-Z]+.*).*[!@#$%]+.*)|((?=.{8,})(?=.*\d+.*)(?=.*[a-z]+.*).*[A-Z]+.*)/

    def validate_each(record, attribute, value)
        record.errors.add(attribute, I18n.t('validate.format')) unless value =~ VALID_PASSWORD_REGEX
    end
end