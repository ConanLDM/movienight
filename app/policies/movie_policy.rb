class MoviePolicy < ApplicationPolicy
  attr_reader :current_user, :movie

  def initialize(current_user, movie)
    @current_user = current_user
    @movie = movie
  end

  def create?
    current_user.admin?
  end
  end

  def index?
    current_user.admin?
  end

  def show?
    current_user.admin? || current_user.movies.exists?(id: movie.id)
  end
  end

  def update?
    current_user.admin?
  end
  
  def destroy?
    current_user.admin?
  end
end
