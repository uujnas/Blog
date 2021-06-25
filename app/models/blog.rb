class Blog < ApplicationRecord
    has_one_attached :profile_pic
    # validates :name, presence: true
    validates :title, presence: true
    validates :title, :length =>{:minimum => 10}
    # validates :description, :length =>{:minimum =>50}
    has_rich_text :content

    belongs_to :category
    belongs_to  :user

    has_many :comments, dependent: :destroy

   
end
