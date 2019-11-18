class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  
  def index
    @movies = current_user.movies
  end

  def show
  end

  def new
    @movie = current_user.movies.new 
  end
  
  def create
    @movie = current_user.movies.new(movie_params)

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end

  end

  def edit
  end

  def update

    if @movie.update(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end

  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

    def set_movie
      @movie = current_user.movies.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :genre, :year)
    end

end
