require "./environment"
require "pry"

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get "/" do
      erb :root
    end

    get "/new" do
      erb :"pirates/new"
    end

    post "/pirates" do
      pirate_name = params["pirate"]["name"]
      pirate_weight = params["pirate"]["weight"]
      pirate_height = params["pirate"]["height"]
      @pirate = Pirate.new(pirate_name, pirate_weight, pirate_height)
      @ships = params["pirate"]["ships"].map do |ship_info|
        Ship.new(ship_info["name"], ship_info["type"], ship_info["booty"])
      end

      erb :"pirates/show"
    end
  end
end
