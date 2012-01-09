module Play
  class App < Sinatra::Base

    get "/search" do
      hash = {
        :songs => Player.search(params[:q]).map { |song| song.to_json }
      }
      Yajl.dump hash
    end

    get "/user/:splat" do
      user = User.find(params[:splat])

      hash = {
        :songs => user.stars.map { |song| song.to_json }
      }
      Yajl.dump hash
    end

    post "/star" do
      song = Song.find(params[:id])
      @current_user.star(song)
    end

    delete "/star" do
      song = Song.find(params[:id])
      @current_user.star(song)
    end
    
  end
end