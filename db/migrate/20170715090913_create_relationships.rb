class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :person_a_id
      t.integer :person_b_id

      t.timestamps
    end
  end
end
