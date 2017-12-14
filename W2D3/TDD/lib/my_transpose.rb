def my_transpose(matrix)
  return [] if matrix.empty?
  raise "Need to be a matrix (2d array)" unless matrix.all? { |row| row.is_a?(Array) }

  transposed = []

  matrix.each_index do |col|
    column = []
    matrix[col].each_index do |row|
      column << matrix[row][col]
    end
    transposed << column
  end
  transposed
end
