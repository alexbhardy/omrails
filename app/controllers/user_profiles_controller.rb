class UserProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
    # GET /user_profiles
    def index
      @user_profiles = UserProfile.all
    end

    # GET /user_profiles/1
    def show
      @user_profile = UserProfile.find(params[:id])
    end

    # GET /user_profiles/new
    def new
      @user_profile = UserProfile.new
    end

    # GET /user_profiles/1/edit
    def edit
      @user_profile = UserProfile.find(params[:id])
    end

    # POST /user_profiles
    def create
      @user_profile = UserProfile.new(user_profile_params)
        if @user_profile.save
          redirect_to @user_profile, notice: 'User profile was successfully created.'
        else
          render :new
        end
      end

    # PATCH/PUT /user_profiles/1
    def update
      @user_profile = UserProfile.find(params[:id])
        if @user_profile.update(user_profile_params)
          redirect_to @user_profile, notice: 'User profile was successfully updated.'
        else
          render :edit
        end
      end

    # DELETE /user_profiles/1
    def destroy
      @user_profile = UserProfile.find(params[:id])
      @user_profile.destroy
      redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.'
      end

    private

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_profile_params
        params.require(:user_profile).permit(:content)
      end
  end
