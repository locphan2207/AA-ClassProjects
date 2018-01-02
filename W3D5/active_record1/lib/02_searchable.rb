require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    string = []
    params.each do |col, value|
      string << "#{col} = ?"
    end
    values = params.values
    hash = DBConnection.execute(<<-SQL, values)
      SELECT * 
      FROM #{table_name}
      WHERE #{string.join(' AND ')}
    SQL
    self.parse_all(hash)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
  
end
