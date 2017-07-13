class AddMobileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mobile, :string, unique: true
  end
end
