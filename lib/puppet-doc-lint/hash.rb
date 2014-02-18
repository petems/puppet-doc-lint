class Hash
  
  def paramflat
    result = {}

    self.each do |key, val|
      result[key] = (defined? val.value) ? val.value : nil
    end

    result
  end

  def kill_blank_keys
    delete_if { |k, v| k == '' }
  end
  
end
