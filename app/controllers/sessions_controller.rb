class SessionsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]
  def new

  end

  def create
    @student = Student.find_by(email: params[:email].downcase)
    if @student and @student.authenticate(params[:password])
      flash[:notice] = "Welcome #{@student.name}. Please, explore all the things."
      session[:student_id] = @student.id
      redirect_to cookies[:return_to_url] || root_path
      cookies[:return_to_url] = nil
    else
      flash[:error] = "Something went wrong. Please, try again in a few moments."
      render :new
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You have successfully logged out!"
    redirect_to login_path
  end
end