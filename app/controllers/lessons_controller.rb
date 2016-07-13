class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show 
  end 

  private 


  def require_authorized_for_current_lesson 
    if !current_user.enrolled_in?(current_lesson.section.course) 
      redirect_to course_path(current_lesson.section.course), :alert => "You must enroll to view this course."
      end
    end  

  helper_method :current_lesson 
  def current_lesson 
    @current_lesson ||= Lesson.find(params[:id])

  end
end 

# class LessonsController < ApplicationController
#   before_action :authenticate_user!
#   before_action :require_authorized_for_current_course

#   def show
#   end

#   private

#   def require_authorized_for_current_course
#     if current_course.user != current_user
#       redirect_to :back, alert: 'You must be enrolled in the course to view the lessons.'
#     end
#   end

#   helper_method :current_course
#   def current_course
#     @current_course ||= Course.find(params[:id])
#   end
# end 