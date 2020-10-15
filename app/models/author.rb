class Author < ApplicationRecord
  belongs_to :country

  validates :name, :age, presence: true

  def self.authorSort(param)
    if param == "edad" || param == "-edad"
      all.order(age: "#{param == "edad" ? 'ASC' : 'DESC'}".to_sym)
    else
      all
    end
  end
end
