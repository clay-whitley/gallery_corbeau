class Post < ActiveRecord::Base
  before_save :post_date, :default_author

  private
    def post_date
      self[:posted_at] = DateTime.now unless self[:posted_at]
    end

    def default_author
      if !self[:author] || self[:author] == "" 
        self[:author] = "David"
      end
    end
end
