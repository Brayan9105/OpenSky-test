require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validate' do
    Country.create(name: 'Colombia')
    Author.create(name: 'Sara', age: 33, country_id: 1)

    context "when post does not have all fields" do
      it 'should return false' do
        expect(Post.new.valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Post.new(title: 'My post').valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Post.new(content: 'Some content').valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Post.new(author_id: 1).valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Post.new(title: 'My post', content: 'My content').valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Post.new(title: 'My post', author_id: 1).valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Post.new(content: 'My content', author_id: 1).valid?).to be_falsey 
      end
    end# End context

    context 'when post has all fields' do
      it 'should return true' do
        expect(Post.new(title: 'My post', content: 'My content', author_id: 1).valid?).to be_truthy 
      end
    end# End context
  end# End describe
end
