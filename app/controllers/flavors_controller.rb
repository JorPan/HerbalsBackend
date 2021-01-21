class FlavorsController < ApplicationController
    def index 
        @flavors = Flavor.all

        render json: @flavors
    end
end
