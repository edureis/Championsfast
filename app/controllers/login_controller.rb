class LoginController < ActionController::Base

  def login
    render :template => 'layouts/login'
  end

end
