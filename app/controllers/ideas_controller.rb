class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def create
    current_user.ideas.create!(idea_params)

    redirect_to action: :index
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :location, :url)
  end
end
