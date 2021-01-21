class JoinersController < ApplicationController

    def index
        @joiners = Joiner.all 
        render json: @joiners 

    end

    def show 
        @joiner = Joiner.find(params[:id])

        render json: @joiner
    end


    def create
        Joiner.destroy_all
        $strains_to_display = []
        selected_positive_effects = []
        selected_negative_effects = []
        selected_medical_effects = []
        select_effects = []  

        params.each do |key, value|
           if (key.include? "effect" && "positive")
                selected_positive_effects.push(key.split("-").first)
           elsif (key.include? "effect" && "medical")
                selected_medical_effects.push(key.split("-").first)
           elsif (key.include? "effect" && "negative")
                selected_negative_effects.push(key.split("-").first)
           end
           
           select_effects.push(Effect.find_by effect: "{\"effect\"=>\"Relaxed\", \"type\"=>\"positive\"}")
        end


       selected_strains = []
        clears_positive = Strain.all.select do |strain|
            selected_positive_effects.each do |pos_effect|
                break if strain.positive_effects.exclude? pos_effect
            end
        end

        clearsmedical = clears_positive.select do |strain|
            selected_medical_effects.each do |med_effect|
                break if strain.medical_effects.exclude? med_effect
            end
        end

            clears_all_three = clearsmedical.select do |strain|
                selected_negative_effects.each do |neg_effect|
                    break if strain.negative_effects.include? neg_effect
                end
            end

        clears_all_three.each do |strain|
            $strains_to_display.push(strain)
        end

        strain_array = $strains_to_display.map do |strain|
            Strain.find_by name: strain.name
        end

        effect_array = Effect.all.map do |effect|
            effect.id
        end

       @joiners = strain_array.map do |strain|
            Joiner.create(
                strain_id: strain.id,
                name: strain.name,
                category: strain.race,
                flavors: strain.flavor,
                positive_effects: strain.positive_effects,
                medical_effects: strain.medical_effects,
                negative_effects: strain.negative_effects
            )
        end


        redirect_to "https://herbalstrains.firebaseapp.com/suggestions.html" 

    end


end

