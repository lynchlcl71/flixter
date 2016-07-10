class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course

  def show
  end

  private

  def require_authorized_for_current_course
    if current_course.user != current_user
      redirect_to :back, alert: 'You must be enrolled in the course to view the lessons.'
    end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:id])
  end
end