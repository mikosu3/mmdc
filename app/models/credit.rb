class Credit < ActiveRecord::Base
  attr_accessor :author_name
  attr_accessor :distribution_url

  belongs_to :wanted
  belongs_to :author

  has_many :credit_log, dependent: :destroy

  has_and_belongs_to_many :authors

  before_save :set_author_id
  after_save :save_credit_log

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
  validates :author_name, presence: true
  validates :author_name, length: { maximum: 100 }
  validates :wanted_id, uniqueness: true
  validates :distribution, length: { maximum: 250 }, format: { with: /(^$)|(^(sm|im|td)[0-9]+$)/ix, allow_blank: true }
  validates :url, format: { with: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix, allow_blank: true }, length: { maximum: 250 }

  attr_accessor :updated_screen_name


  after_update do
    @is_create = false
  end

  # 検索許可するパラメータ
  def self.ransackable_attributes auth_object = nil
    %w(wanted_file_name_count wanted_folder_name_count author_name_count name)
  end

  def updated_screen_name
    return User.find(self.updated_by).screen_name
  end

  # 配布先(ニコニコのURL)を取得
  def distribution_url
    case self.distribution
    when /^sm[0-9]+/ then
      return 'http://www.nicovideo.jp/watch/' + distribution
    when /^im[0-9]+/ then
      return 'http://seiga.nicovideo.jp/seiga/' + distribution
    when /^td[0-9]+/ then
      return 'http://3d.nicovideo.jp/works/' + distribution
    else
      return nil
    end
  end


  # 作者名からIDを取得　なければ登録して取得
  private
    def set_author_id

      #作者名からID取得
      author = Author.find_by(:name => self.author_name)

      #なければ新規登録
      if author.nil? then
        author = Author.new
        author.name = author_name
        author.updated_by = self.updated_by
        author.save
      end

      self.authors.push  author
#      self.author_id = author.id
    end

    def save_credit_log
      credit_log = CreditLog.new

      credit_log.credit_id = self.id
      credit_log.authors = self.authors
      credit_log.user_id = self.updated_by
      credit_log.name = self.name
      credit_log.distribution = self.distribution
      credit_log.url = self.url

      credit_log.save


      add_history
    end

    def add_history
      history = History.new

      history.link = '/credits/' + self.id.to_s + '/edit'
      history.item = 'クレジット'
      history.item_name = self.name

      if @is_create.nil?
        @is_create = true
      end

      history.is_create = @is_create

      history.save
    end

end
