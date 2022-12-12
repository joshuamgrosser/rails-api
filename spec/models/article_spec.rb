require 'rails_helper'

RSpec.describe Article, type: :model do
  subject(:article) { described_class.new }

  context 'validation' do
    context 'without title' do
      before { article.title = nil }

      it { is_expected.not_to be_valid }
    end

    context 'without body' do
      before { article.body = nil }

      it { is_expected.not_to be_valid }
    end
  end
end
