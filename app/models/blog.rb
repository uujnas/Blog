class Blog < ApplicationRecord
    has_one_attached :profile_pic
    # validates :name, presence: true
    validates :title, :written_by, :job_title,:description, presence: true
    validates :title, :length =>{:minimum => 10}
    validates :description, :length =>{:minimum =>50}
    has_rich_text :content
   
end
