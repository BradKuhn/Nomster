class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def verify_correct_user
		respond_to do |format|
 			format.html { redirect_to root_url, alert: "You cannot access that part of the website." }
 			format.xml { head :forbidden }
 			format.json { head :forbidden }
		end
	end
end
