module CommentsHelper
  def date(comment)
    comment.created_at.strftime('%h/%d/%y')
  end
end
