class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas

  has_many :relationships,
    foreign_key: "person_a_id",
    dependent: :destroy

  has_many :people,
    through: :relationships,
    source: "person_b",
    class_name: "User",
    dependent: :destroy

  has_many :participations,
    dependent: :destroy

  def bidirectional_relationships
    Relationship.where(person_a_id: id).or(Relationship.where(person_b_id: id))
  end

  def people
    bidirectional_relationships.map { |relationship| relationship.other_person(self) }
  end
end
