def create_old_page(base, idx, last_idx, num)
    first = idx * num + 1
    last = (idx + 1) * num
    meta = {}
    meta[:title] = " home - page #{idx + 1}"
    meta[:kind] = 'page'
    meta[:old_idx] = idx

    if idx == 1
        meta[:prev_idx] = "/"
    else
        meta[:prev_idx] = base + "#{idx}"
    end

    if idx == last_idx
        meta[:next_idx] = nil
    else
        meta[:next_idx] = base + "#{idx + 2}"
    end

    contents = %{
        <% pages = sorted_articles.slice(@item[:old_idx] * #{num}, #{num}) %>
        <% pages.each do |a| %>
          <h1><%= link_to a[:title], a.path %></h1>
          <%= a.compiled_content %>
        <% end %>
        <hr>
        <a href="<%= @item[:prev_idx] %>">&laquo Newer</a>
        <% if not @item[:next_idx].nil? %>
          <a class="pull-right" href="<%= @item[:next_idx] %>">Older &raquo</a>
        <% end %>
    }
    create_item base + "#{idx + 1}", meta, contents
end

def create_item(base, meta, contents)
    it = Nanoc::Item.new(contents, meta, base)
    @items << it
end
