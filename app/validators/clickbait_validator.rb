class ClickbaitValidator < ActiveModel::Validator 
  def validate record
    if record.title
      requirements = ["Won't Believe", "Secret", "Top[number]", "Guess"]
      if requirements.detect {|element| record.title.include?(element)}.nil?
        record.errors[:title] << "No clickbait"
      end
    end
  end
end