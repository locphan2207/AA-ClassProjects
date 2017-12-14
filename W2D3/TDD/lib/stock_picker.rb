def stock_picker(stock)
  return [] if stock.length <= 1
  result = [0, 1]
  previous_profit = stock[1] - stock[0]
  stock.each_with_index do |el1, idx1|
    stock[idx1+1..-1].each_with_index do |el2, idx2|
      if el2 - el1 > previous_profit
        previous_profit = el2 - el1
        result = [idx1, idx2+idx1+1]
      end
    end
  end
  result
end
