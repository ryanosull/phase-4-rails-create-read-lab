class PlantsController < ApplicationController

    def index
        # render json: Plant.all, except: [:created_at, :updated_at], status: :ok
        render json: Plant.all
    end
    
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
        render json: plant, except: [:created_at, :updated_at]
        else
        render json: {errors: ['Plant dead - forgot to water :(']}
        end
    end
    
    def create
        plant = Plant.create(params.permit(:name, :image, :price))
        render json: plant, status: :created
    end


end
