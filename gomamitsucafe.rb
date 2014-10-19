# -*- coding: utf-8 -*-

Plugin.create :gomamitsucafe do

  def random_string(length)
    chars = "ごま蜜cafe".split('')
    size = chars.size
    
    Array.new(length) { |idx|
      chars[rand(size)]
    }.join
  end

  (1..8).each do |i|
    puts random_string i
  end

  filter_show_filter do |msgs|
    msgs.map! do |m|
      Message.new(:message=>random_string(m.to_s.size),
                  :system=>true)
    end
    [msgs]
  end
end
