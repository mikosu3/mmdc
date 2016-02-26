class Credit < ActiveRecord::Base
  attr_accessor :author_name
  attr_accessor :user_id

  belongs_to :wanted
  belongs_to :author
  before_save :set_author_id
  after_save :save_credit_log

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
  validates :author_name, presence: true
  validates :author_name, length: { maximum: 100 }
  validates :wanted_id, uniqueness: true
  validates :distribution, length: { maximum: 250 }, format: { with: /(^$)|(^(sm|im|td)[0-9]+$)/ix, allow_blank: true }
  validates :url, format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true }, length: { maximum: 250 }


  # 作者名からIDを取得　なければ登録して取得
  private
    def set_author_id

      #作者名からID取得
      author = Author.find_by(:name => self.author_name)

      #なければ新規登録
      if author.nil? then
        author = Author.new
        author.name = author_name
        author.updated_by = self.user_id
        author.save
      end

      self.author_id = author.id
    end

    def save_credit_log
      credit_log = CreditLog.new

      credit_log.credit_id = self.id
      credit_log.author_id = self.author_id
      credit_log.user_id = self.user_id
      credit_log.name = self.name
      credit_log.distribution = self.distribution
      credit_log.url = self.url

      credit_log.save
    end
end
