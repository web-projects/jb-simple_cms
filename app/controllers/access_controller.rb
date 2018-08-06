class AccessController < ApplicationController

  layout 'admin'

  # WHITELIST APPROACH TO FORCE DEFAULT PAGES TO LOGIN
  before_action  :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    # display text & links
    @username = session[:username]
  end

  def login
    # login form
  end

  def attempt_login

    if params[:username].present? && params[:password].present?

      found_user = AdminUser.where(:username => params[:username]).first

      if found_user
        logger.debug("login for user: #{found_user}")
        authorized_user = found_user.authenticate(params[:password])
      end

    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(admin_path)
    else
      # Display error on same page before rendering next page
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end

  # ************************************************************************* #
  private
  # ************************************************************************* #

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      # prevent action from running
      redirect_to(access_login_path)
    end
  end

end
