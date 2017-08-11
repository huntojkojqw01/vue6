class UsersController < ApplicationController
	def index
		@users=User.page(params[:page]).per(params[:per_page])
	end
	def create
		@user=User.new(user_params)
		@create_success=@user.save		
	end
	def destroy
		user=User.find_by(params[:id])
		if user
			user.destroy
			@destroy_success=true
		else
			@destroy_success=false
		end		
	end
	private
	def user_params
		params.permit(:name,:email)
	end
end