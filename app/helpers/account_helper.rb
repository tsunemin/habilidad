module AccountHelper
  def select_sex
    [[I18n.t("dictionary.sex.male"), 0], [I18n.t("dictionary.sex.female"), 1]]
  end
end
