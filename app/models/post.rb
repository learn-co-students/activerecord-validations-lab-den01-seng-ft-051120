require 'pry'
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 10 }
    validates_with CategoryValidator
    validate :valid_title, on: :create

    def valid_title
        titles = ["won't", "believe", "secret", "top", "guess", "true"]
        if !self.title
            return false
        end
        
        titles.each do |word|
            if self.title.downcase.include?(word)
                return true
            else
                errors[:title] << "Hey! More click-baity!"
            end
        end
    end
end
