class MovieLibrary

  @movies = nil

  def initialize
    @movies = Hash.new
  end

  def testAll
    #test addMovie
    addMovie("Harry Potter", 5)
    if @movies.has_key?("Harry Potter")
      puts "addMovie [true]"
    else
      puts "addMovie [false]"
    end

    #test showMovies
    if (showMovies == "Harry Potter: 5")
      puts "showMovies [true]"
    else
      puts "showMovies [false]"
    end

    #test getRating
    if (getRating("Harry Potter") == 5)
      puts "getRating [true]"
    else
      puts "getRating [false]"
    end
  end

  def addMovie(movie, rating)

  end

  def showMovies

  end

  def getRating(movie)

  end

end

ml = MovieLibrary.new
ml.testAll












