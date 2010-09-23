class String
  def titleize
    characters = chars.to_a
    characters[0].upcase + characters[1..-1].join
  end
end