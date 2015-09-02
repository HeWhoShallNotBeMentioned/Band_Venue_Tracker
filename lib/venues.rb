Class Venues < ActiveRecord::Base

  has_and_belongs_to_man(:bands)
  validates :name, presence: true, uniqueness: true, length { minimum: 2 }
  before_save(:capitalize_name)

  private 

  define_method(:capitalize_name) do
    self.name = (name().capitilize())
  end
end
