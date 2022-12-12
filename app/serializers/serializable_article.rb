# frozen_string_literal: true

class SerializableArticle < BaseSerializer
  type 'articles'

  attributes :title, :body, :created_at, :updated_at

  has_many :comments do
    data do
      @object.comments
    end

    # link :related do
    #   @url_helpers.article_comments_url(@object.id)
    # end

    meta do
      { count: @object.comments.count }
    end
  end
end
