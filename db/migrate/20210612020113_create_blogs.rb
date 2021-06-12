class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.string :written_by

      t.timestamps
    end
  end
end
