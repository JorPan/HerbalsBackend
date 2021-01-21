class StrainsController < ApplicationController

    def index
        if params[:search]
            @strains = Strain.where('name LIKE ?', `%#{params[:search]}%`)
        else
            @strains = Strain.all
        end


            render json: @strains
            # redirect_to "https://herbalstrains.firebaseapp.com/strains.html"
    end

    def show 
        @strain = Strain.find(params[:id])

        render json: @strain
    end


end
