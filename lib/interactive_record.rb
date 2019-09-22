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
  
  def initialize(properties={})
    properties.each do |property, value|
      self.send("#{property}=", value)
    end
  end
  
  def table_name_for_insert
    self.class.table_name
  end
  
  def col_names_for_insert
    
  end
  
  def values_for_insert
    
  end
  
  def save
    
  end
  
  def self.find_by_name
    
  end
  
  def self.find_by
    
  end
  
end