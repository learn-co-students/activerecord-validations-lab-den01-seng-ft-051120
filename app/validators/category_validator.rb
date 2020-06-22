class CategoryValidator < ActiveModel::Validator
    def validate(record)
        unless ("non-fiction").include?(record.category.downcase)
            record.errors[:category] << "Hey! That doesn't work!"
        end
    end
end