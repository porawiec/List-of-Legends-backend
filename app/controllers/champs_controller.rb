class ChampsController < ApplicationController
    @champs = Champ.all
    render json: @champs, include: [:skins]
end
