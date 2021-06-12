class AddBodyToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :job_title, :text
  end
end
