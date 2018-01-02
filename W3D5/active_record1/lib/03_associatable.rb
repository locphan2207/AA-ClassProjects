require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    @class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @foreign_key = "#{name}_id".to_sym
    @class_name = name.capitalize
    @primary_key = :id
    
    options.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @foreign_key = "#{self_class_name.downcase}_id".to_sym
    @class_name = name.singularize.capitalize
    @primary_key = :id
    
    options.each do |key, value|
      self.send("#{key}=", value)
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    option = BelongsToOptions.new(name, options)
    define_method("#{name}") do
      p foreign_key = self.send("#{option.foreign_key}")
      p modelClass = option.model_class
      p params = {foreign_key => modelClass}
      p send("#{modelClass}.where(#{params})")
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
