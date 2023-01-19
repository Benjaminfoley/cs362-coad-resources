# An abstract class from which different types of applications will inherit
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
