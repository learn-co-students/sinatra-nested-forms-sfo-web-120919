require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      "Welcome to the Nested Forms Lab!"
    end


    get '/new' do #creating a new pirate instance this should take them to the form
      erb :'/pirates/new'

    end

    post '/pirates' do 

      @pirate = Pirate.new(params[:pirate])
     
      @ships = params[:pirate][:ships].each do |details|
        Ship.new(details)

      end

        @ships = Ship.all
        erb :'/pirates/show'
    end

    # code other routes/actions here

  end
end
