class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :artist
      t.string :title
      t.string :comment
      t.string :author

      t.timestamps
    end
  end
end
