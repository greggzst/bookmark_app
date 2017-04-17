module WebsitesHelper
  def present_search_results(results)
    list = "<ul class='websites-list'>"
    results.each do |key, value|
      website = Website.find(key)
      list += "<li class='website-#{website.id}'>#{website.url}</li>"
      bookmarks = website.bookmarks.select do |b|
        if value.is_a?(Array)
          value.include?(b.id)
        else
          value = b.id
        end  
      end
      list += "<ul>"
      bookmarks.each do |b|
        list += "<li>"
        list += render partial: "bookmarks/bookmark", locals: {bookmark: b}
        list += "</li>"
      end
      list += "</ul>"  
    end
    list += "</ul>"
    list.html_safe
  end
end
