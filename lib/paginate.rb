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
        <hr><div class="row">
        <div class="span2 offset1"><a href="<%= @item[:prev_idx] %>">&laquo Newer</a></div>
        <div class="span3 offset2"><a href="#">- Blog Archives -</a></div>
        <% if not @item[:next_idx].nil? %>
          <div class="span2 offset2"><a href="<%= @item[:next_idx] %>">Older &raquo</a></div>
        <% end %>
        </div>
    }
    create_item base + "#{idx + 1}", meta, contents
end

def create_item(base, meta, contents)
    it = Nanoc::Item.new(contents, meta, base)
    @items << it
end
