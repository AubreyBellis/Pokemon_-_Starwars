class Pokemon < ApplicationRecord
    include HTTParty
    base_uri 'https://pokeapi.co/api/v2/pokemon'
  
    def self.generate(api_id)
        pokemon = find_by api_id: api_id
        return pokemon unless pokemon.nil?
    
        response = get "/#{api_id}"
        placeholder_image = response['sprites']['front_default']
    
        create!(name: response['name'],
                image: placeholder_image,
                wins: 0, 
                api_id: api_id)
      end
end
