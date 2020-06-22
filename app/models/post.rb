class Post < ActiveRecord::Base
  include ActiveRecord::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with ClickbaitValidator, on: :create
end
