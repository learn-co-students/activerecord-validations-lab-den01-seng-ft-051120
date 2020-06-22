class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    validate :click_bait

    def click_bait
        if title.present? && title.include?("Won't Believe")
            return true
        elsif title.present? && title.include?("Secret")
            return true
        elsif title.present? && title.include?("Top [number]")
            return true
        elsif title.present? && title.include?("Guess")
            return true 
        else 
            errors.add(:title, "This title is not click-bait-y enough!")
        end
    end
end
