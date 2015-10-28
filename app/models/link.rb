class Link < ActiveRecord::Base
  acts_as_commentable

  belongs_to :account

end
