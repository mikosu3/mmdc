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

  has_many :credit

  attr_accessor :modify_type

  before_save :set_disp_name

  after_create do
    self.modify_type = '登録'
  end

  after_update do
    self.modify_type = '更新'
  end
  after_save :add_history

  # 検索許可するパラメータ
  def self.ransackable_attributes auth_object = nil
    %w(name disp_name)
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
      history.item = '作者情報'
      history.modify_type = self.modify_type

      history.save
    end

end
