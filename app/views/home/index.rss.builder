xml.instruct! :xml, :version => "1.0"
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title "更新情報"

    @histories.each do |history|
      xml.item do
        xml.title history.item + (history.is_create? ? '登録':'更新')
        xml.description history.item + (history.is_create? ? '登録':'更新') + ' ' + history.item_name
        xml.pubDate history.created_at.strftime('%Y/%m/%d %H:%M:%S')
        xml.guid "http://mmdc.tiger-star.net#{history.link}"
        xml.link "http://mmdc.tiger-star.net#{history.link}"
      end
    end
  end
end
