require 'json'
require 'rest-client'
require 'pry'

# Effect.destroy_all
# Strain.destroy_all
# Joiner.destroy_all

strains_URL = 'http://strainapi.evanbusse.com/4nX8ujH/strains/search/all'
response = RestClient.get(strains_URL)
    all_strains = JSON.parse(response)
    # binding.pry
    # allStrains

effects_URL = 'http://strainapi.evanbusse.com/4nX8ujH/searchdata/effects'
response = RestClient.get(effects_URL)
    all_effects = JSON.parse(response)
    
all_effects.each do |effect|
    Effect.create(
        effect: effect
    )
end
    # binding.pry

all_strains.each do |strain|
    Strain.create(
        name: strain[0],
        race: strain[1]["race"],
        flavor: strain[1]["flavors"],
        positive_effects: strain[1]["effects"]["positive"],
        negative_effects: strain[1]["effects"]["negative"],
        medical_effects: strain[1]["effects"]["medical"]
    )
end

flavors_URL = 'http://strainapi.evanbusse.com/4nX8ujH/searchdata/flavors'
response = RestClient.get(flavors_URL)
    all_flavors= JSON.parse(response)

all_flavors.each do |flavor|
    Flavor.create(
        name: flavor
    )
end






       