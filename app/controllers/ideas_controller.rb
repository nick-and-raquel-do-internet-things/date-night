class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def create
    current_user.with_lock do
      idea = current_user.ideas.create!(idea_params)

      idea.participations.create!(user: current_user)

      participations = params[:idea][:participations].reject { |id| id == "0" }

      participations.each do |user_id|
        idea.participations.create!(user_id: user_id)
      end

      idea.save!
    end

    redirect_to action: :index
  end

  def destroy
    Idea.find(params[:id]).destroy!

    redirect_to action: :index
  end

  private

  def idea_params
    params.require(:idea).permit(:name, :location, :url)
  end
end
