class Foo

  def update_pos(diff)
    @cursor_pos = [3, 3]
    @cursor_pos.map!.with_index {|el, idx| el + diff[idx] }
  end
end

foo = Foo.new
p foo.update_pos([1, 0])
