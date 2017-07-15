class RelationshipsController < ApplicationController
  def index
    @relationships = current_user.bidirectional_relationships
  end

  def create
    email = params[:email]

    other_user = User.find_by(email: email)

    if other_user
      current_user.relationships.create!(person_b: other_user)
      flash[:notice] = "Successfully added relationship with #{other_user.name}"
    else
      flash[:alert] = "No user found with email: #{email}"
    end

    redirect_to action: :index
  end
end
