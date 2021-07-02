class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title, foreign_key: true
      t.text :description, foreign_key: true
      t.string :written_by, foreign_key: true

      t.timestamps
    end
  end
end
