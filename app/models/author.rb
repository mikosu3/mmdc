class Author < ActiveRecord::Base


  validates :name, presence: true
  validates :name, length: { maximum: 100 }

  validates :nico, length: { maximum: 20 } , numericality: {:only_integer => true, :greater_than => 0, allow_blank: true }
  validates :pixiv, length: { maximum: 20 } , numericality: {:only_integer => true, :greater_than => 0, allow_blank: true }
  validates :url, length: { maximum: 250 }
  validates :twitter, length: { maximum: 30 }
  validates :url, format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true }, length: { maximum: 250 }
  validates :email, length: { maximum: 250 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, allow_blank: true }

  belongs_to :credit

end
