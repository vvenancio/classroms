class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update]
  before_action :respond_with_course, only: :edit

  helper_method :course_statuses

  def index
    @courses = Course.all

    respond_with(@courses)
  end

  def new
    @course = Course.new

    respond_with(@course)
  end

  def create
    @course = Course.new(course_params)
    @course.save

    respond_with(@course, location: courses_path)
  end

  def edit; end

  def update
    @course.update(course_params)

    respond_with(@course, location: courses_path)
  end

  private

  def course_params
    params.require(:course).permit(:name, :status, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def respond_with_course
    respond_with(@course)
  end

  def course_statuses
    DefaultStatus.to_a
  end
end