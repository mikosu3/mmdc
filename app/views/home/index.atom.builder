atom_feed do |feed|
  feed.title("更新情報")
  feed.updated(@histories.first.created_at)

  @histories.each do |history|
    feed.entry( history, url: "http://mmdc.tiger-star.net#{history.link}" ) do |entry|
      entry.title(history.item + (history.is_create? ? '登録':'更新'))
      entry.content(history.item + (history.is_create? ? '登録':'更新') + ' ' + history.item_name, type: 'text')
    end
  end
end