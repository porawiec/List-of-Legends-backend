class ChampsController < ApplicationController
    @champs = Champ.all
    render json: @champs
end
