class Gemfile < ApplicationRecord
  belongs_to :user
  has_many :favorites, as: :favoritable, dependent: :destroy

  def count_gems
    self.content.split("\n").select { |line| line.strip.start_with?("gem") }.count
  end
end
