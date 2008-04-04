# codecite template
atom_feed do |feed|
  feed.title "#{@document.name} Changes"
  feed.updated @changes.first.created_at
  for change in @changes
    feed.entry(change) do |entry|
      entry.title(change.name)
      entry.content(change.description)
      entry.author do |author|
        author.name change.author
      end
    end
  end
end
# codecite template