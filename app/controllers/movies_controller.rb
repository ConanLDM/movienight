class MoviesController < ApplicationController
include Pundit::authorization
  
  # GET /movies or /movies.json
  def index
    @movies = Movie.all
    authorize @movies
    
    render json:: @movies
  end

  def create
    @movie = Movie.new(body: params[:body])
    authorize @movie

    @movie.save!

    render json: @doc, status: :created
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.find(params[:id])
    authorize @movie

    render json: @movie
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    authorize @movie

  # GET /movies/1/edit
  def edit
    authorize @movie
  end

  # POST /movies or /movies.json

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    @movie =Movie.find(params[:id])
    authorize @movie
 
    @movie.update!(movie_params)

    render json: @movie
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    authorize @movie

    @movie.destroy

    render status: :no_content

  end

  private
  
    # Will decide on if body or name for .permit later
    def movie_params
      params.require(:movie).permit(:body)
    end
end
