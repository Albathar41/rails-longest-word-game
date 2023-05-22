require "open-uri"

class GamesController < ApplicationController

  def new
    @lettres = ('A'..'Z').to_a.sample(10)
  end

  def score
    @try = params[:test]
    grille = params[:grille]
    url = "https://wagon-dictionary.herokuapp.com/#{@try}"

    if verif(@try, grille) == true && JSON.parse(URI.open(url).read)["found"] == true
        @result = "you win"
    else
      @result = "https://www.oiseaux.net/photos/vincent.palomares/images/pigeon.biset.vipa.1g.jpg"
    end
  end

private


  def verif(attempt, grid)
    attempt.upcase.chars.all? { |character| attempt.upcase.count(character) <= grid.count(character) }
  end

end
