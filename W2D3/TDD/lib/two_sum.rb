class Array
  def two_sum
    return [] if self.length <= 1

    results = []
    self.each_with_index do |left, idx_left|
      self[(idx_left+1)..-1].each_with_index do |right, idx_right|
        results << [idx_left, idx_right+idx_left+1] if (left + right).zero?
      end
    end
    results
  end
end
