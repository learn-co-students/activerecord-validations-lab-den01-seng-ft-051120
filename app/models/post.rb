class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-fiction"]}
    validate :clickbait_title

    def clickbait_title
        if title
            for i in ["Won't Believe", "Secrets", "Guess", "Top 3"]
                if title.include? i
                    return true
                end
            end 
        end
        errors.add(:title, "must include clickbait")
    end
    
end
