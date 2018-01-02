require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    tablename =
    if @columns.nil?
      @columns = DBConnection.execute2(<<-SQL)
        SELECT * 
        FROM #{self.table_name}
      SQL
      .first.map {|column_name| column_name.to_sym}
    end
    @columns
  end

  def self.finalize!
    self.columns.each do |col_name|
      define_method(col_name) {attributes[col_name]}
      define_method(col_name.to_s + '=') do |new_val| 
        attributes[col_name] = new_val
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name = self.name.tableize if @table_name.nil?
    @table_name
  end

  def self.all
    data = DBConnection.execute(<<-SQL)
      SELECT * 
      FROM #{self.table_name}
    SQL
    self.parse_all(data)
  end

  def self.parse_all(results)
    results.map {|datum| self.new(datum)}
  end

  def self.find(id)
    hash = DBConnection.execute(<<-SQL, id)
      SELECT * 
      FROM #{self.table_name}
      WHERE id = ?
    SQL
    self.parse_all(hash).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      unless self.class.columns.include?(attr_name.to_sym)
        raise "unknown attribute '#{attr_name}'" 
      end
      self.send("#{attr_name.to_sym}=", value)
    end
  end

  def attributes
    @attributes = {} if @attributes.nil?
    @attributes
  end

  def attribute_values
    @attributes.values
  end

  def insert
    col_names = self.class.columns[1..-1]
    question_marks = Array.new(col_names.length){'?'}.join(',')
    DBConnection.execute(<<-SQL, attribute_values)
      INSERT INTO #{self.class.table_name} (#{col_names.join(',')}) 
      VALUES (#{question_marks})
    SQL
    @attributes[:id] = DBConnection.last_insert_row_id
    # p self.class.find(@attributes[:id])
  end

  def update
    set_string = []
    attributes.each do |col_name, value|
      set_string << "#{col_name} = ?"
    end
    
    DBConnection.execute(<<-SQL, attribute_values[1..-1], attribute_values[0])
      UPDATE #{self.class.table_name} 
      SET #{set_string[1..-1].join(', ')}
      WHERE #{set_string[0]}
    SQL
  end

  def save
    if attributes[:id].nil?
      insert 
    else 
      update 
    end
  end
end
