module WebsitesHelper
  def present_search_results(results)
    #results is a hash - key website id, value either single bookmark id or array of ids
    #check if has elements
    if results.present?
      #build results list
      list = "<ul class='search-results'>"
      results.each do |key, value|
        website = Website.find(key)
        list += "<li class='website-#{website.id}'><a href='#' class='result-link'>#{website.url}</a>"
        #get bookmarks according to values in results hash
        bookmarks = website.bookmarks.select do |b|
          if value.is_a?(Array)
            value.include?(b.id)
          else
            b.id == value
          end
        end
        #build list for bookmakrs and use bookmark partial to render bookmarks
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
    else
      #if not print message
      message = "<div class='no-results'>There is no results meeting your criteria!</div>"
      message.html_safe
    end    
  end  
end
