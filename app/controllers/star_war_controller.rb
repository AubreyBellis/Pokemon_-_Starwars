class StarWarController < ApplicationController
    def update
        @star_war = StarWar.find(params[:id])
        @star_war.update(wins: @star_war.wins + 1)
        redirect_to fights_path
    end
end
