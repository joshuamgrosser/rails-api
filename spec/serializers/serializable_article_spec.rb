require 'rails_helper'

RSpec.describe SerializableArticle, type: :serializer do
  subject { serializer }

  let(:article) { FactoryBot.build(:article) }
  let(:serializer) { described_class.new(object: article) }
  let(:serialized) { serializer.as_jsonapi }
  let(:attributes) { serialized[:attributes] }

  it { is_expected.to be_a described_class }

  describe 'id' do
    subject { serialized[:id] }

    it { is_expected.to eq article.id.to_s }
  end

  describe 'created_at' do
    subject { attributes[:createdAt] }

    it { is_expected.to eq article.created_at }
  end
end
