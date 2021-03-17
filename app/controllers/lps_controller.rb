require_relative '../models/lp'

class LpsController
  def initialize
    @view = LpsView.new
  end

  def index
    lps = Lp.all
    @view.index(lps)
  end

  def create
    artist = @view.ask_for("What's the artist name")
    title = @view.ask_for("What's the LP title")
    year = @view.ask_for("What's the year of the release")
    price = @view.ask_for("And what's its price")
    new_lp = Lp.new(title: title, artist: artist, year: year, price: price)
    new_lp.save
  end

  def update
    id = @view.ask_for("What's the ID").to_i
    lp_to_update = Lp.find(id)
    new_artist = @view.ask_for("What's the new artist's name")
    new_title = @view.ask_for("What's the right title")
    new_year = @view.ask_for("What's the correct year of the release")
    new_price = @view.ask_for("And the new price")
    lp_to_update.artist = new_artist
    lp_to_update.title = new_title
    lp_to_update.year = new_year
    lp_to_update.price = new_price
    lp_to_update.save
  end

  def destroy
    id = @view.ask_for("What's the ID").to_i
    lp_to_update = Lp.find(id)
    lp_to_update.destroy
  end
end
