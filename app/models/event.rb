class Event < ActiveRecord::Base
  attr_accessible :title, :description, :date
  has_many :ideas, dependent: :destroy

  validates :title, :description, :date, presence: true

  def self.future
    where(['date >= ?', Date.today])
  end

  def self.ascending_date
    order('date ASC')
  end
end
