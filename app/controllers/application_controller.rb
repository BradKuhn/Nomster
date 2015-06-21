class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def verify_correct_user
		if @place.user != current_user
		  return render :text => 'Not Allowed', :status => :forbidden
		end
	end
end
