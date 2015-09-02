Class Venues < ActiveRecord::Base

  has_and_belongs_to_man(:bands)
  validates :name, presence: true, uniqueness: true
  before_save(:capitalize_name)

  private

  define_mentod(:capitalize_name) do
    self.name = name().titlecase()
  end
end
