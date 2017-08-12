class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => [:create,:destroy]
	def index
		@users=User.page(params[:page]).per(params[:per_page]||10)
	end
	def create
		@user=User.new(user_params)
		@user.save	
	end
	def destroy
		user=User.find_by(params[:id])
		user.destroy if user			
	end
	private
	def user_params
		params.require(:user).permit(:name,:email)
	end
end