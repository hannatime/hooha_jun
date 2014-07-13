module CustomersHelper

  def custom_page_entries_info(collection, options = {} )
    collection_name = options[:collection_name] || (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))
      if collection.num_pages < 2
        case collection.size
        when 0; info = "No contacts found"
        when 1; info = "Displaying <strong>1</strong> contact"
        else;   info = "Displaying <strong>all #{collection.size}</strong> contacts"
        end
      else
        info = %{Displaying contacts <strong>%d&ndash;%d</strong> of <strong>%d</strong> in total}% [
          collection.offset_value + 1,
          collection.offset_value + collection.length,
          collection.total_count
        ]
      end
      info.html_safe
  end

end


