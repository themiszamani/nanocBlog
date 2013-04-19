begin
  require 'nanoc3/tasks'
rescue LoadError
  require 'rubygems'
  require 'nanoc3/tasks'
end

task :default => [:compile]

task :compile do
  system('nanoc3', 'compile')
end

task :optimize_pngs do
  system('find', 'output', '-name', '*.png', '-exec', 'optipng', '-o7', '{}', ';')
end

require 'stringex'
desc "Create a new post"
task :new_post, :title do |t, args|
  mkdir_p './content/posts'
  args.with_defaults(:title => 'New Post')
  title = args.title
  filename = "./content/posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.to_url}.md"

  if File.exist?(filename)
    abort('rake aborted!') if ask("#{filename} already exists. Want to overwrite?", ['y','n']) == 'n'
  end

  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts '---'
    post.puts "title: \"#{title}\""
    post.puts "created_at: #{Time.now}"
    post.puts 'kind: article'
    post.puts 'categories:'
    post.puts '    - misc'
    post.puts 'published: false'
    post.puts "---\n\n"
  end
end
