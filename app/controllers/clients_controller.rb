class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def show
        render json: find_client
    end

    def index
        render json: Client.all
    end

    def update
        client = find_client
        client.update!(client_params)
        render json: client
    end

    private

    def client_params
        params.permit(:name, :age)
    end

    def find_client
        Client.find(params[:id])
    end

    def record_not_found
        render json:  {error: "Client not found"}, status: :not_found
    end


end
