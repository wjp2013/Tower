class Membership < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................
  belongs_to :team
  belongs_to :user
  # validations ...............................................................
  validates :role, acceptance: true
  # callbacks .................................................................
  # after_touch :touch_all_variants
  # scopes ....................................................................
  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  ROLES = %w(owner admin member guest)
  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................
  # private
end