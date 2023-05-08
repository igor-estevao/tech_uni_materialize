class StudentsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  before_action :set_student, only: [ :show, :edit, :update, :destroy]
  before_action :require_same_student, only: [:edit, :update]

  def index
    @students = Student.all
    flash.now[:notice] = helpers.pluralize(Student.all.count, "student") + " registered."
    respond_to do |format|
      format.html { }
    end
  end

  def show
  end

  def new
    @student = Student.new
    @student.name = Faker::Name.name
    @student.email = Faker::Internet.email
  end

  def create
    @student = Student.new(student_params)
    @student.password = Faker::Internet.password if @student.password.nil?
    @student.creator_id = Student.first.id
    respond_to do |format|
      if @student.save
        flash[:notice] = "Welcome #{@student.name}! Feel free to Explore!"
        session[:student_id] = @student.id
        format.html { redirect_to root_path }
      else
        flash.now[:error] = @student.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  def edit
    @student == current_user
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        flash[:notice] = "Student Updated!"
        format.html { redirect_to student_path(@student) }
      else
        flash.now[:error] = @student.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

private
  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find params[:id]
  end

  def require_same_student
    if current_user != @student
      flash[:error] = "You don't have the rights to perform this action."
      redirect_to student_path(current_user)
    end
  end
end
