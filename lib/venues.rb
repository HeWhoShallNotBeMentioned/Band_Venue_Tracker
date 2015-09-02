class Venue < ActiveRecord::Base

  has_and_belongs_to_many(:bands)
  validates :name, presence: true, uniqueness: true
  before_save(:capitalize_name)

  private

  define_method(:capitalize_name) do
    self.name = name().titlecase()
  end
end
