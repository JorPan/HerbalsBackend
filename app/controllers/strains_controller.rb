class StrainsController < ApplicationController

    def index
        if params[:search]
            search_term = params[:search].capitalize
            @strains = Strain.where('name LIKE ?', "%#{search_term}%")
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
