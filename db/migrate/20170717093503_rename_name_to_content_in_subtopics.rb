class RenameNameToContentInSubtopics < ActiveRecord::Migration[5.1]
  def change
    rename_column :subtopics, :name, :content
  end
end
