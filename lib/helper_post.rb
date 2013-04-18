module PostHelper
  def blog_articles
    #if ENV['NANOC_ENV'] == 'production'
      sorted_articles.select{|a| a[:published] }
    #else
    #  sorted_articles
    #end
  end

  def get_pretty_date(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end

  def get_post_start(post)
    content = post.compiled_content
    if content =~ /\s<!-- more -->\s/
      content = content.partition('<!-- more -->').first +
      "<div class='read-more'><a href='#{post.path}'>Continue reading &rsaquo;</a></div>"
    end
    return content
  end
end

include PostHelper

module Nanoc3::Helpers::Blogging

	def check_data(params)
		raise RuntimeError.new('Cannot build feed: site configuration has no base_url') 	if @site.config[:base_url].nil?
		raise RuntimeError.new('Cannot build feed: feed item has no title') if @item[:title].nil?
		raise RuntimeError.new('Cannot build feed: no articles') if feed_articles(params).empty?
		raise RuntimeError.new('Cannot build feed: one or more articles doesn\'t have a date') if feed_articles(params).any? { |a| a[:created_at].nil? }
	end

	def feed_articles(params)
		params[:articles] || latest_articles(10)
	end

	def feed_content_proc(params)
		params[:content_proc] || lambda { |a| a.reps[0].content_at_snapshot(:pre)}
	end

	def feed_excerpt_proc(params)
		params[:excerpt_proc] || lambda { |a| a[:excerpt] }
	end

	def rss_feed(params={})
		require 'builder'
		require 'time'
		check_data params
		# Create builder
		buffer = ''
		xml = Builder::XmlMarkup.new(:target => buffer, :indent => 2)
		# Build feed
		xml.instruct!
		xml.rss(:version => '2.0') do
			xml.channel do
				xml.title @item[:title]
				xml.language 'en-us'
				xml.lastBuildDate feed_articles(params).first[:created_at].rfc822
				xml.ttl '40'
				xml.link @site.config[:base_url]
				xml.description
				feed_articles(params).each do |a|
					xml.item do
						xml.title a[:title]
						xml.description feed_content_proc(params).call(a)
						xml.pubDate a[:created_at].rfc822
						xml.guid url_for(a)
						xml.link url_for(a)
						xml.author @site.config[:author_email]
						xml.comments url_for(a)+'#comments'
						a[:categories].each do |t|
							xml.category t
						end
					end
				end
			end
			buffer
		end
	end

	def latest_articles(max=nil)
		total = @site.items.select{|p| p.attributes[:kind] == 'article'}.sort{|a, b| a.attributes[:created_at] <=> b.attributes[:created_at]}.reverse
		max ||= total.length
		total[0..max-1]
	end

	def popular_articles(max=nil)
		total = @site.items.select{|p| p.attributes[:created_at] && p.attributes[:kind] == 'article' && p.attributes[:popular]}.sort{|a, b| a.attributes[:date] <=> b.attributes[:date]}.reverse
		max ||= total.length
		total[0..max-1]
	end

	def articles_by_month
		articles = latest_articles
		m_articles = []
		index = -1
		current_month = ""
		articles.each do |a|
			next unless a.attributes[:created_at]
			month = a.attributes[:created_at].strftime("%B %Y")
			if current_month != month then
				# new month
				m_articles << [month, [a]]
				index = index + 1
				current_month = month
			else
				# same month
				m_articles[index][1] << a
			end
		end
		m_articles
	end

	def month_link_with_count(month, count)
		permalink = month.downcase.gsub /\s/, '-'
		%{<a href="/archives/#{permalink}.html">#{month}</a> (#{count})}
	end

end

include Nanoc3::Helpers::Blogging
