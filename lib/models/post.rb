class Post < ActiveRecord::Base
  before_save :post_date, :default_author

  private
    def post_date
        self[:posted_at] = DateTime.now unless self[:posted_at]
    end

    def default_author
      self[:author] = "David" unless self[:author]
    end
end
