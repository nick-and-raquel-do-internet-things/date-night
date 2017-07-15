class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.belongs_to :idea
      t.belongs_to :user

      t.timestamps
    end
  end
end
