class CreateInsta < ActiveRecord::Migration[6.1]
  def change
    create_table :insta do |t|
      t.text :body

      t.timestamps
    end
  end
end
