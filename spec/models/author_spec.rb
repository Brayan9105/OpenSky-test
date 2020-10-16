require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validate' do
    context "when author does not have all fields" do
      it 'should return false' do
        expect(Author.new.valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Author.new(name: 'Juan').valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Author.new(age: 33).valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Author.new(country_id: 1).valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Author.new(name: 'Juan', age: 33).valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Author.new(name: 'Juan', country_id: 1).valid?).to be_falsey 
      end

      it 'should return false' do
        expect(Author.new(age: 33, country_id: 1).valid?).to be_falsey 
      end
    end# End context

    context 'when author has all fields' do
      Country.create(name: 'Colombia')

      it 'should return true' do
        expect(Author.new(name: 'as', age: 33, country_id: 1).valid?).to be_truthy
      end
    end# End context
  end# End describe
end
