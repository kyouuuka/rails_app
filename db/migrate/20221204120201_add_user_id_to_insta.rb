class AddUserIdToInsta < ActiveRecord::Migration[6.1]
  def change
    add_column :insta, :user_id, :integer
  end
end
