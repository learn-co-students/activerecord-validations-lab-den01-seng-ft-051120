# frozen_string_literal: true

class TitleValidator < ActiveModel::Validator
  def validate(model)
    if model.title
      unless model.title.include? "Won't Believe" || 'Secret' || 'Top' || 'Guess'
        model.errors[:title] << "This post isn't clickbaity enough!"
      end
    end
  end
end
