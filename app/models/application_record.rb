# Purpose: To be the parent class of all models in the application. This is
#          to ensure that all models are using the same connection to the
#          database.
#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
