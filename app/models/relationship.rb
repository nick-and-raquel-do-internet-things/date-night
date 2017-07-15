class Relationship < ApplicationRecord
  belongs_to :person_a, class_name: 'User'
  belongs_to :person_b, class_name: 'User'

  def other_person(user)
    if user == person_a
      person_b
    else
      person_a
    end
  end
end
