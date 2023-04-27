class CoursesController < ApplicationController
  
  skip_before_action :require_user, only: [:index, :show]

  def index
    @courses = Course.all
  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
  
  def enroll_self
    course = Course.find params[:course_id]
    if course.in? current_user.courses
      flash[:warning] = "You can't enroll in a course that you are already enrolled!"
    else
      course.students << current_user 
      flash[:notice] = "Congratulations. You enrolled in #{course.name}."
    end
    redirect_to courses_path
  end

end
