class Comment < ActiveRecord::Base
  belongs_to :writter
  belongs_to :post
end
