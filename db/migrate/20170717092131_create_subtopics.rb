class CreateSubtopics < ActiveRecord::Migration[5.1]
  def change
    create_table :subtopics do |t|
      t.string :name

      t.timestamps
    end

    add_reference :subtopics, :topic, foreign_key: true
  end
end
