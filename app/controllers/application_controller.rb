class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_q

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def set_q
    @q = Post.search(params[:q]) #qは検索用のデータ
    @posts = @q.result.page(params[:page]) #@customersは結果の表示
    end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :description
    devise_parameter_sanitizer.for(:sign_up) << :image_url
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:account_update) << :description
    devise_parameter_sanitizer.for(:account_update) << :image_url
  end


end
