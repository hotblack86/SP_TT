

module LogSorter

  def view_counter(unique:)
    @data.each_with_object({}) do |(key, value), list|
      list[key] = unique ? value.uniq.length : value.length
    end
  end

  def most_views
    view_counter(unique: false).sort_by {|a,b| -b}.to_h
  end

  def most_unique_views
    view_counter(unique: true).sort_by {|a,b| -b}.to_h
  end

end  