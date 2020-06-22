require 'pry'

class TitleValidator < ActiveModel::Validator
    def validate(record)
        titles = ("won'tbelievesecrettopguesstrue")
        binding.pry
        unless titles.include?(record.title.downcase)
            record.errors[:title] << "Hey! More click-baity!"
        end
    end
end
