class ProfilesController < ApplicationController
    before_action :auth_user, only: [:edit, :home]
    before_action :auth_params, only: [:create, :update]

    def home
    end

    def new
        @profile = Profile.new
    end

    def create
        @profile = current_user.profile.new(auth_params)
        if @profile.save
            redirect_to "/items/index", notice: "Your profile has been created successfully."
        else
            redirect_to "/profile/new", alert: "Something went wrong with your profile please try again."
        end
    end

    private

    def auth_user
        current_user && current_user.id == @profile.user.id
    end

    def auth_params
        (params.require(:profile).permit(:username, :address, :address2, :city, :country, :state, :zip, :picture))
    end
end
