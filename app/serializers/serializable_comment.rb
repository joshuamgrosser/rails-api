# frozen_string_literal: true

class SerializableComment < BaseSerializer

  type 'comments'

  attributes :commentor, :body, :created_at, :updated_at

  belongs_to :article do
    data do
      SerializableArticle.new(@object.article)
    end
  end

end
