class CreateTopicsSubtopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics_subtopics do |t|
      t.string :content, null: false
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
