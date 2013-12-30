class Post < ActiveRecord::Base
  before_save :post_date, :default_author, :render_html

  private
    def post_date
      self[:posted_at] = DateTime.now unless self[:posted_at]
    end

    def default_author
      if !self[:author] || self[:author] == "" 
        self[:author] = "David"
      end
    end

    def render_html
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :strikethrough => true, :prettify => true)
      self[:rendered_content] = markdown.render(self[:body])
    end
end
