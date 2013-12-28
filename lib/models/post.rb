class Post < ActiveRecord::Base
  attr_accessor :body, :posted_at, :author
  validates :body, presence: true

  before_save :default_post_date, :default_author

  private
    def default_post_date
      self[:posted_at] = DateTime.now unless self[:posted_at]
    end

    def default_author
      self[:author] = "David" unless self[:author]
    end
end
