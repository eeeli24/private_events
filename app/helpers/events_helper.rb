module EventsHelper
  def current_user
    @current_user = User.find(session[:current_user]['id']) if session[:current_user]
  end
end
