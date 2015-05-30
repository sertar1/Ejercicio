class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
	session[:user] = nil
  	render "/index"
  end
  def api
  	@response = HTTParty.get('http://ceud.herokuapp.com/geo/' + params[:city])
  	render "/api"
  end
end
