class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      define_method(name) do 
        self.instance_variable_get('@' + name.to_s)
      end
      
      define_method(name.to_s + "=") do |new_val| 
        self.instance_variable_set('@' + name.to_s, new_val)
      end
    end
  end
end
