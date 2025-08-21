#!/usr/bin/env ruby
# Generate backlinks data for Jekyll site
# Run this before building the Jekyll site

require 'yaml'
require 'pathname'
require 'json'
require 'date'
require 'set'

class BacklinksGenerator
  def initialize(source_dir)
    @source_dir = Pathname.new(source_dir)
    @backlinks = Hash.new { |hash, key| hash[key] = [] }
    @data_dir = @source_dir / '_data'
    @backlinks_dir = @source_dir / '_backlinks'
  end

  def generate
    puts "Generating backlinks..."

    # Ensure directories exist
    @data_dir.mkpath
    @backlinks_dir.rmtree if @backlinks_dir.exist?
    @backlinks_dir.mkpath

    # Find all markdown files
    markdown_files = find_markdown_files

    puts "Found #{markdown_files.size} markdown files"

    # Build backlinks index
    build_backlinks_index(markdown_files)

    # Add navigation-referenced pages that might not have content links
    add_navigation_pages

    # Add pages with social sharing enabled that might not have content links
    add_social_share_pages



    # Generate backlink pages
    generate_backlink_pages

    # Save data for Jekyll
    save_backlinks_data

    puts "Generated #{@backlinks.size} backlink pages"
  end

  private

  def find_markdown_files
    markdown_files = []

    # Find files in collections (directories starting with _)
    Dir.glob(@source_dir / '_*' / '**' / '*.md').each do |file|
      file_path = Pathname.new(file)
      next if file.include?('/_site/') || file.include?('/_vendor/') || file.include?('/_backlinks/')
      next unless file_path.file? # Only process actual files, not directories
      markdown_files << file_path
    end

    # Find pages in root
    Dir.glob(@source_dir / '*.md').each do |file|
      file_path = Pathname.new(file)
      next unless file_path.file? # Only process actual files, not directories
      markdown_files << file_path
    end

    markdown_files
  end

  def build_backlinks_index(markdown_files)
    markdown_files.each do |file|
      process_file(file)
    end
  end

  def process_file(file)
    content = file.read

    # Extract YAML frontmatter
    frontmatter = {}
    if content.match(/\A---\s*\n(.*?\n)?---\s*\n/m)
      yaml_content = $1
      begin
        frontmatter = YAML.unsafe_load(yaml_content) || {}
      rescue => e
        puts "Warning: Could not parse frontmatter for #{file}: #{e.message}"
      end
      content = content.sub(/\A---\s*\n(.*?\n)?---\s*\n/m, '')
    end

    # Get page URL (permalink if specified, otherwise generated from filename)
    source_url = get_page_url(file, frontmatter)

    # Also get the Jekyll internal URL (for social-share compatibility)
    jekyll_internal_url = get_jekyll_internal_url(file)

    page_title = frontmatter['title'] || file.basename('.md').to_s.gsub(/[-_]/, ' ').split.map(&:capitalize).join(' ')

    # Find all markdown links in content
    links = extract_links(content)

    # Deduplicate links to same target from the same page
    unique_targets = Set.new
    links.each do |link|
      target_url = normalize_url(link)

      # Skip self-references and external links
      next if target_url == source_url || external_link?(link)

      # Only add one backlink entry per source page, even if multiple links exist
      unless unique_targets.include?(target_url)
        unique_targets.add(target_url)
        @backlinks[target_url] << {
          'url' => source_url,
          'title' => page_title,
          'excerpt' => extract_excerpt(content)
        }
      end
    end

    # If this page has a permalink override, also create a mapping for Jekyll's internal URL
    if frontmatter['permalink'] && jekyll_internal_url != source_url
      @backlinks[jekyll_internal_url] = @backlinks[source_url] || []
    end
  end

  def get_page_url(file, frontmatter)
    # Check if there's a permalink override in frontmatter
    if frontmatter['permalink']
      return normalize_url(frontmatter['permalink'])
    end

    # Get relative path from source directory
    rel_path = file.relative_path_from(@source_dir)

    # Handle different collection types
    if rel_path.to_s.start_with?('_')
      # Collection file
      path_parts = rel_path.to_s.split('/')
      collection_name = path_parts[0][1..-1] # Remove leading _
      file_path = path_parts[1..-1].join('/')

      # Remove .md extension and add trailing slash
      url = "/#{collection_name}/#{file_path}".sub(/\.md$/, '') + '/'
    else
      # Regular page
      url = "/#{rel_path}".sub(/\.md$/, '') + '/'
      url = '/' if url == '/index/'
    end

    normalize_url(url)
  end

  def get_jekyll_internal_url(file)
    # Get what Jekyll would use as page.url (based on filename, not permalink)
    rel_path = file.relative_path_from(@source_dir)

    # Handle different collection types
    if rel_path.to_s.start_with?('_')
      # Collection file
      path_parts = rel_path.to_s.split('/')
      collection_name = path_parts[0][1..-1] # Remove leading _
      file_path = path_parts[1..-1].join('/')

      # Remove .md extension and add trailing slash
      url = "/#{collection_name}/#{file_path}".sub(/\.md$/, '') + '/'
    else
      # Regular page
      url = "/#{rel_path}".sub(/\.md$/, '') + '/'
      url = '/' if url == '/index/'
    end

    normalize_url(url)
  end

  def extract_links(content)
    links = []

    # Match markdown links [text](url)
    content.scan(/\[([^\]]+)\]\(([^)]+?)(?:\s+"[^"]*")?\)/) do |text, url|
      links << url.strip
    end

    # Match reference-style links [text]: url
    content.scan(/^\[([^\]]+)\]:\s*(.+)$/m) do |text, url|
      links << url.strip
    end

    links.uniq
  end

  def normalize_url(url)
    return url if url.nil? || url.empty?

    # Remove fragment identifiers and query parameters
    url = url.split(/[#?]/)[0]

    # Skip if empty after cleaning
    return url if url.empty?

    # Handle malformed collection URLs like /_datascience/ds_index.md
    if url.match(%r{^/_([^/]+)/(.+)\.md$})
      collection = $1
      filename = $2
      url = "/#{collection}/#{filename}/"
    end

    # Ensure URL starts with /
    url = "/#{url}" unless url.start_with?('/')

    # Remove .md extensions if present
    url = url.sub(/\.md$/, '')

    # Ensure URL ends with / (except for file extensions)
    unless url.match(/\.[a-zA-Z0-9]+$/) || url.end_with?('/')
      url = "#{url}/"
    end

    # Remove double slashes
    url.gsub(%r{/+}, '/')
  end

  def external_link?(url)
    url =~ %r{^https?://} || url =~ %r{^mailto:} || url =~ %r{^#} || url =~ %r{^ftp://}
  end

  def extract_excerpt(content)
    # Get first paragraph or first 150 characters
    paragraphs = content.split(/\n\s*\n/)
    first_para = paragraphs.find { |p| p.strip.length > 0 }
    return '' unless first_para

    # Remove markdown formatting
    excerpt = first_para.gsub(/[#*_`\[\]()]/, '').strip

    if excerpt.length > 150
      excerpt = excerpt[0..147] + '...'
    end

    excerpt
  end

  def add_navigation_pages
    # Read navigation file to find important pages that should always have backlinks
    nav_file = @source_dir / '_data' / 'navigation.yml'
    return unless nav_file.exist?

    begin
      nav_data = YAML.unsafe_load(nav_file.read)
      important_urls = extract_urls_from_navigation(nav_data)

      important_urls.each do |url|
        normalized_url = normalize_url(url)
        # Add empty backlinks entry if it doesn't exist
        @backlinks[normalized_url] = [] unless @backlinks.key?(normalized_url)
      end
    rescue => e
      puts "Warning: Could not process navigation file: #{e.message}"
    end
  end

  def extract_urls_from_navigation(nav_data, urls = [])
    case nav_data
    when Hash
      if nav_data['url']
        urls << nav_data['url']
      end
      nav_data.each_value { |value| extract_urls_from_navigation(value, urls) }
    when Array
      nav_data.each { |item| extract_urls_from_navigation(item, urls) }
    end
    urls
  end

  def add_social_share_pages
    # Find all markdown files and check if they have social sharing enabled
    markdown_files = find_markdown_files

    markdown_files.each do |file|
      content = file.read

      # Extract YAML frontmatter
      frontmatter = {}
      if content.match(/\A---\s*\n(.*?\n)?---\s*\n/m)
        yaml_content = $1
        begin
          frontmatter = YAML.unsafe_load(yaml_content) || {}
        rescue => e
          next # Skip files with unparseable frontmatter
        end
      end

      # Get page URL (permalink if specified, otherwise generated from filename)
      page_url = get_page_url(file, frontmatter)

      # Check if page has social sharing enabled (explicitly or via collection defaults)
      has_share = false

      # Check explicit share setting in frontmatter
      if frontmatter.key?('share')
        has_share = frontmatter['share']
      else
        # Check collection defaults - assume share: true for collections that typically have it
        if page_url.start_with?('/scicompannounce/', '/compdemos/', '/datascience/', '/scicomputing/', '/pathways/')
          has_share = true
        end
      end

      # If page has social sharing enabled, ensure it has a backlinks entry
      if has_share
        @backlinks[page_url] = [] unless @backlinks.key?(page_url)
      end
    end
  end



  def generate_backlink_pages
    # First pass: collect all URLs that are referenced in backlinks
    referenced_urls = Set.new
    @backlinks.each_value do |backlinks_array|
      backlinks_array.each { |link| referenced_urls.add(link['url']) }
    end

    # Second pass: ensure all referenced URLs have backlinks entries
    referenced_urls.each do |url|
      @backlinks[url] = [] unless @backlinks.key?(url)
    end

    @backlinks.each do |target_url, backlinks|
      # Create flatter file structure without extra index directories
      safe_path = target_url.gsub(/^\//, '').gsub(/\/$/, '')
      # Truncate very long paths and replace problematic characters
      safe_path = safe_path.gsub(/[^a-zA-Z0-9\/\-_.]/, '_')[0..100]

      # Remove any double .md extensions that might have been created
      safe_path = safe_path.sub(/\.md\.md$/, '.md')

      # Create the directory structure
      file_path = @backlinks_dir / "#{safe_path}.md"
      file_path.dirname.mkpath

      # Find target page info
      target_title = find_target_title(target_url)

      # Generate page content
      content = generate_page_content(target_title, target_url, backlinks)

      # Write page
      file_path.write(content)
    end
  end



  def find_target_title(target_url)
    # Try to find the actual page to get its title
    # This is a simple heuristic - could be improved
    possible_files = [
      @source_dir / target_url.gsub(/^\//, '').gsub(/\/$/, '') + '.md',
      @source_dir / target_url.gsub(/^\//, '').gsub(/\/$/, '') / 'index.md'
    ]

    # Check collections
    Dir.glob(@source_dir / '_*').each do |collection_dir|
      collection_name = File.basename(collection_dir)[1..-1]
      if target_url.start_with?("/#{collection_name}/")
        file_path = target_url.sub("/#{collection_name}/", '').gsub(/\/$/, '') + '.md'
        possible_files << Pathname.new(collection_dir) / file_path
      end
    end

    possible_files.each do |file|
      if file.exist?
        content = file.read
        if content.match(/\A---\s*\n(.*?\n)?---\s*\n/m)
          begin
            frontmatter = YAML.unsafe_load($1) || {}
            return frontmatter['title'] if frontmatter['title']
          rescue
            # Continue to next file
          end
        end
      end
    end

    # Fallback: generate title from URL
    target_url.split('/').reject(&:empty?).last&.gsub(/[-_]/, ' ')&.split&.map(&:capitalize)&.join(' ') || 'Unknown Page'
  end

  def generate_page_content(target_title, target_url, backlinks)
    # Escape quotes in title for YAML safety
    escaped_title = target_title.gsub('"', '\"')

    content = <<~CONTENT
      ---
      layout: single
      title: "What Links to: #{escaped_title}"
      sitemap: false
      search: false
      share: false
      toc: false
      ---

      This page shows all pages that link to **[#{target_title}](#{target_url})**.

      ## Linking Pages (#{backlinks.size})

    CONTENT

    backlinks.each do |link|
      content += "### [#{link['title']}](#{link['url']})\n\n"
      if link['excerpt'] && !link['excerpt'].empty?
        content += "#{link['excerpt']}\n\n"
      end
      content += "---\n\n"
    end

    content += <<~FOOTER

      *This page is automatically generated. Links are updated when the site is rebuilt.*
    FOOTER

    content
  end

  def save_backlinks_data
    # Save backlinks data for use in Jekyll templates
    data = {
      'backlinks' => @backlinks,
      'generated_at' => Time.now.strftime('%Y-%m-%d %H:%M:%S')
    }

    (@data_dir / 'backlinks.yml').write(data.to_yaml)
    puts "Saved backlinks data to _data/backlinks.yml"
  end
end

# Run the generator
if __FILE__ == $0
  source_dir = ARGV[0] || '.'
  generator = BacklinksGenerator.new(source_dir)
  generator.generate
end
