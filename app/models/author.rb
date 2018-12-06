class Author < ActiveRecord::Base

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
  validates :name, uniqueness: true
  validates :disp_name, length: { maximum: 200 }

  validates :nico, length: { maximum: 20 } , numericality: {:only_integer => true, :greater_than => 0, allow_blank: true }
  validates :pixiv, length: { maximum: 20 } , numericality: {:only_integer => true, :greater_than => 0, allow_blank: true }
  validates :url, length: { maximum: 250 }
  validates :twitter, length: { maximum: 30 }
  validates :url, format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true }, length: { maximum: 250 }
  validates :email, length: { maximum: 250 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, allow_blank: true }

  has_and_belongs_to_many :credits
  has_and_belongs_to_many :credit_logs

  attr_accessor :updated_screen_name

  before_save :set_disp_name

  auto_strip_attributes :name, :disp_name, :nico, :pixiv, :url, :twitter, :email,  :nullify => false

  after_update do
    @is_create = false
  end

  after_save :add_history

  # 検索許可するパラメータ
  def self.ransackable_attributes auth_object = nil
    %w(name disp_name)
  end

  def updated_screen_name
    return User.find(self.updated_by).screen_name
  end

  private

    # 表記名が空だった場合は作者名と同じにする
    def set_disp_name
      if self.disp_name.blank? then
        self.disp_name = self.name
      end
    end

    def add_history
      history = History.new

      history.link = '/authors/' + self.id.to_s + '/edit'
      history.item = '作者'
      history.item_name = self.name

      if @is_create.nil?
        @is_create = true
      end

      history.is_create = @is_create

      history.save
    end

end

# == Schema Information
#
# Table name: authors
#
#  id           :integer          not null, primary key
#  name         :string(100)      not null
#  url          :string(255)
#  twitter      :string(255)
#  pixiv        :string(255)
#  email        :string(255)
#  lock_version :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  nico         :string(255)
#  disp_name    :string(255)
#  updated_by   :integer          not null
#
# Indexes
#
#  index_authors_on_name  (name) UNIQUE
#
