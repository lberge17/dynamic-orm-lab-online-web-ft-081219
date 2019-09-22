require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  
  def self.table_name
    self.to_s.downcase.pluralize
  end
  
  def self.column_names
    DB[:conn].results_as_hash = true
    
    table_info = DB[:conn].execute("pragma table_info('#{table_name}')")
    
    table_info.map do |row|
      row["name"]
    end.compact
  end
  
  def initialize(hash)
    
  end
  
end