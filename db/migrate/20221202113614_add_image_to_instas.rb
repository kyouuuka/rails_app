class AddImageToInstas < ActiveRecord::Migration[6.1]
  def change
    add_column :instas, :image, :string
  end
end
