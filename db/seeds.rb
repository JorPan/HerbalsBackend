require 'json'
require 'rest-client'
require 'pry'



effects_seeds = [
    {
        effect: "Relaxed",
        type: "positive"
    },
    {
        effect: "Dizzy",
        type: "negative"
    },
    {
        effect: "Hungry",
        type: "positive"
    },
    {
        effect: "Euphoric",
        type: "positive"
    },
    {
        effect: "Happy",
        type: "positive"
    },
    {
        effect: "Depression",
        type: "medical"
    },
    {
        effect: "Insomnia",
        type: "medical"
    },
    {
        effect: "Pain",
        type: "medical"
    },
    {
        effect: "Stress",
        type: "medical"
    },
    {
        effect: "Cramps",
        type: "medical"
    },
    {
        effect: "Creative",
        type: "positive"
    },
    {
        effect: "Energetic",
        type: "positive"
    },
    {
        effect: "Talkative",
        type: "positive"
    },
    {
        effect: "Lack Of Appetite",
        type: "medical"
    },
    {
        effect: "Nausea",
        type: "medical"
    },
    {
        effect: "Dry Mouth",
        type: "negative"
    },
    {
        effect: "Headache",
        type: "medical"
    },
    {
        effect: "Uplifted",
        type: "positive"
    },
    {
        effect: "Tingly",
        type: "positive"
    },
    {
        effect: "Paranoid",
        type: "negative"
    },
    {
        effect: "Sleepy",
        type: "positive"
    },
    {
        effect: "Fatigue",
        type: "medical"
    },
    {
        effect: "Headaches",
        type: "medical"
    },
    {
        effect: "Dry Eyes",
        type: "negative"
    },
    {
        effect: "Focused",
        type: "positive"
    },
    {
        effect: "Eye Pressure",
        type: "medical"
    },
    {
        effect: "Anxious",
        type: "negative"
    },
    {
        effect: "Giggly",
        type: "positive"
    },
    {
        effect: "Aroused",
        type: "positive"
    },
    {
        effect: "Inflammation",
        type: "medical"
    },
    {
        effect: "Spasticity",
        type: "medical"
    },
    {
        effect: "Seizures",
        type: "medical"
    },
    {
        effect: "Muscle Spasms",
        type: "medical" 
    }
]
       
# Effect.destroy_all
# Strain.destroy_all
# Joiner.destroy_all

strains_URL = 'http://strainapi.evanbusse.com/4nX8ujH/strains/search/all'
response = RestClient.get(strains_URL)
    all_strains = JSON.parse(response)
    # binding.pry
    # allStrains

# effects_URL = 'http://strainapi.evanbusse.com/4nX8ujH/searchdata/effects'
# response = RestClient.get(effects_URL)
#     all_effects = JSON.parse(response)

effects_seeds.each do |effect|
    Effect.create(
        effect: effect[:effect],
        type: effect[:type]
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





