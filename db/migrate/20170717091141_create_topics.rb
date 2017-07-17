class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :name

      t.timestamps
    end

    add_reference :topics, :category, foreign_key: true
  end
end
