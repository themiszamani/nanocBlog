def create_archive_pages
    articles_by_month.each do |article|
      @items << Nanoc::Item.new(
        "<%= render('category', :category => '#{article[0]}') %>",
        {
          :title => "Posts in #{article[0]}",
          :h1 => "#{article[0]} posts",
          :posts => article[1]
        },
        "/archives/#{article[0].downcase.gsub /\s/, '-'}",
        :binary => false
      )
    end
end

