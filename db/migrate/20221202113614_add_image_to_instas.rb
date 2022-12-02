class AddImageToInstas < ActiveRecord::Migration[6.1]
  def change
    add_column :insta, :image, :string
  end
end
