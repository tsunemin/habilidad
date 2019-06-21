class ApplicationController < ActionController::Base

  # filter
  # actionの直前に実行されるfilter
  before_action :set_locale
  before_action :current_user
  before_action :require_sign_in!
  # helper methodとして使用できる
  helper_method :signed_in?

  def set_locale
    I18n.locale = locale
  end

  def locale
    @locale ||= params[:locale] ||= I18n.default_locale
  end

  def default_url_options(options = {})
    options.merge(locale: locale)
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_in(user)
    remember_token = User.create_remember_token
    # cookieにremember_tokenをsetする
    cookies.permanent[:remember_token] = remember_token
    # remember_tokenを更新する
    user.update_column(:remember_token, User.encrypt(remember_token))

    @current_user = user
  end

  def sign_out
    @current_user = nil
    # cookieのremember_tokenを削除する
    cookies.delete(:remember_token)
    redirect_to login_path
  end

  def signed_in?
    @current_user.present?
  end

  private

  def require_sign_in!
    redirect_to login_path unless signed_in?
  end
end
