class DropSubtopics < ActiveRecord::Migration[5.1]
  def change
    drop_table :subtopics
  end
end
