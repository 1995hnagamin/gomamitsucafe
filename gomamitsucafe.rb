# -*- coding: utf-8 -*-

Plugin.create :gomamitsucafe do

  def random_string(length)
    token = ["ごま", "cafe", "ごま蜜cafe", "カフェ", "ごま蜜カフェ"]
    str = ""
    strlen = 0
    until strlen >= length do
      choice = token.sample
      strlen += choice.size
      str += choice
    end
    str
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
