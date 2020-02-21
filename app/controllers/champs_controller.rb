class ChampsController < ApplicationController
    def index
        @champs = Champ.all
        render json: @champs
    end
end
