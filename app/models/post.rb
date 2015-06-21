class Post < ActiveRecord::Base
  has_many :comments

  paginates_per 5

  def self.find_newest_article
    #最新記事を5件取得する
    Post.order(created_at: :DESC).limit(5)
  end

  def pub_date
    created_at.strftime('%Y/%m/%d %H:%M')
  end
end
