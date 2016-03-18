module SessionsHelper

 def log_in(user)
    session[:user_id] = user.id
	refresh_dom_with_partial('div#menu', 'layouts/navbar')
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
	session.delete(:cart)
    session.delete(:user_id)
    @current_user = nil
	refresh_dom_with_partial('div#menu', 'layouts/navbar')
  end
  
  def logged_in!
	 if current_user.nil?
		redirect_to login_path
	end
  end
end
