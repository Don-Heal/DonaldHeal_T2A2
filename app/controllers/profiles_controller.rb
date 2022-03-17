class ProfilesController < ApplicationController
    before_action :auth_params, only: [:create, :update]
    before_action :find_profile, only: [:show, :edit, :update]
    before_action :bought_stats, :listed_stats, only: [:show]

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
            redirect_to "/profiles/new", alert: "Something went wrong with your profile please try again."
        end
    end

    def show
        
    end

    def update
        @profile.update(auth_params)
            if @profile.save
                redirect_to "/profiles/:id", notice: "Your profile has been updated successfully."
            else
                redirect_to "/profiles/:id/edit", alert: "Something went wrong with your changes please try again."
            end
    end

    private

    def find_profile
        @profile = Profile.find_by(user_id: current_user.id)
    end

    def auth_params
        (params.require(:profile).permit(:username, :address, :address2, :city, :country, :state, :zip, :picture))
    end

    def bought_stats
        @bought = Item.where(user_id: current_user.id, sold: true)
    end

    def listed_stats
        @listed = Item.where(user_id: current_user.id, sold: false)
    end

end
