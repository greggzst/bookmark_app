module WebsitesHelper
  def present_search_results(results)
    list = "<ul class='search-results'>"
    results.each do |key, value|
      website = Website.find(key)
      list += "<li class='website-#{website.id}'><a href='#' class='result-link'>#{website.url}</a>"
      bookmarks = website.bookmarks.select do |b|
        if value.is_a?(Array)
          value.include?(b.id)
        else
          value = b.id
        end  
      end
      list += "<ul class='bookmarks-list'>"
      bookmarks.each do |b|
        list += "<li class='bookmark-#{b.id}'>"
        list += render partial: "bookmarks/bookmark", locals: {bookmark: b}
        list += "</li>"
      end
      list += "</ul>"
      list += "</li>"  
    end
    list += "</ul>"
    list.html_safe
  end
end
