require './lib/guide/formater/abnt_name.rb'

class Author < ApplicationRecord
  validates_presence_of :first_name, :abnt_name
  
  before_validation :format_abnt_name
  
  private
    def format_abnt_name
      self.abnt_name = Guide::Formater::AbntName.(first_name, last_name)
    end
end
