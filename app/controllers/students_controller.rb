class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update]
  before_action :respond_with_student, only: :edit

  helper_method :student_statuses

  def index
    @students = Student.all

    respond_with(@students)
  end

  def new
    @student = Student.new

    respond_with(@student)
  end

  def create
    @student = Student.new(student_params)
    @student.save

    respond_with(@student, location: students_path)
  end

  def edit; end

  def update
    @student.update(student_params)

    respond_with(@student, location: students_path)
  end

  private

  def student_params
    params.require(:student).permit(:name, :status, :register_number)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def respond_with_student
    respond_with(@student)
  end

  def student_statuses
    DefaultStatus.to_a
  end
end