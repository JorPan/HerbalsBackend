class StrainsController < ApplicationController

    def index
        if params[:search]
            @strains = Strain.where('name LIKE ?', "%#{params[:search]}%")
        else
            @strains = Strain.all
        end
        # id = Strain.find_by(name: params[:search]).id
        # # byebug
            render json: @strains
        #     redirect_to "http:localhost:3001/strains.html/#{id}"
    end

    def show 
        @strain = Strain.find(params[:id])

        render json: @strain
    end


end
