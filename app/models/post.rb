class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait
  validates :content, presence: true, length: { minimum: 250 }
  validates :summary, presence: true, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  def clickbait 
    # binding.pry
    if title
      title_words = title.split()
      title_words.each_with_index do |title_word, index|
        case
        when title_word == "Won't"
          if title_words[index + 1] == 'Believe'
            return true
          end
        when title_word == 'Secret'
          return true
        when title_word == 'Top'
          if title_words[index + 1].is_a? Integer
            return true
          end
        when title_word == 'Guess'
          return true
        end
      end
    end
    errors.add(:title, 'needs more clickbait')
  end
end
