class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def show
        render json: find_gym
    end

    def index
        render json: Gym.all
    end

    def destroy
        find_gym.destroy
        head :no_content
    end

    def update
        gym = find_gym
        gym.update(gym_params)
        render json: gym
    end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def find_gym
        Gym.find(params[:id])
    end

    def record_not_found
        render json:  {error: "Gym not found"}, status: :not_found
    end

end
