class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :avatar
      t.string :nickname
      t.string :wechat, unique: true
      t.string :name
      t.integer :gender, default: 0, index: true
      t.string :school
      t.string :grade
      t.string :major, unique: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
