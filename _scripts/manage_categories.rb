#!/usr/bin/env ruby

require 'yaml'
require 'find'
require 'date'
require 'set'

class CategoryManager
  def initialize
    @categories_file = '_data/categories.yml'
    @categories = load_categories
    @articles = find_articles_with_categories
  end

  def load_categories
    if File.exist?(@categories_file)
      YAML.load_file(@categories_file) || {}
    else
      puts "Categories file not found: #{@categories_file}"
      {}
    end
  end

  def find_articles_with_categories
    articles = []

    # Search in all collection directories and regular markdown files
    Find.find('.') do |path|
      next unless path.end_with?('.md')
      next if path.include?('_site/') || path.include?('node_modules/')

      content = File.read(path)
      if content.match(/^---\s*\n.*?^---\s*\n/m)
        front_matter = content.match(/^---\s*\n(.*?)^---\s*\n/m)[1]
        begin
          parsed = YAML.safe_load(front_matter, permitted_classes: [Date, Time])
          if parsed && parsed['categories']
            articles << {
              path: path,
              categories: parsed['categories'],
              title: parsed['title'] || File.basename(path, '.md')
            }
          end
        rescue YAML::SyntaxError => e
          puts "Warning: Invalid YAML in #{path}: #{e.message}"
        end
      end
    end

    articles
  end

  def validate_categories
    puts "=== Category Validation Report ==="
    puts

    # Check for undefined categories used in articles
    undefined_categories = Set.new
    @articles.each do |article|
      article[:categories].each do |cat_id|
        unless @categories.key?(cat_id)
          undefined_categories << cat_id
          puts "❌ Undefined category '#{cat_id}' used in: #{article[:path]}"
        end
      end
    end

    if undefined_categories.empty?
      puts "✅ All categories used in articles are properly defined"
    else
      puts
      puts "Undefined categories found: #{undefined_categories.to_a.join(', ')}"
    end

    # Check for unused categories
    used_categories = Set.new
    @articles.each do |article|
      article[:categories].each { |cat| used_categories << cat }
    end

    unused_categories = @categories.keys - used_categories.to_a
    if unused_categories.any?
      puts
      puts "📝 Unused categories (consider removing or promoting):"
      unused_categories.each { |cat| puts "   - #{cat}" }
    end

    # Check for broken links in categories
    puts
    puts "=== Link Validation ==="
    @categories.each do |cat_id, category|
      next unless category['links']

      category['links'].each do |link|
        # Basic validation - check if file exists for internal links
        if link['url'].start_with?('/')
          file_path = link['url'].gsub(/^\//, '').gsub(/\/$/, '') + '.md'
          # Try different possible locations
          possible_paths = [
            file_path,
            "_#{file_path}",
            file_path.sub(/\/([^\/]+)$/, '/_\1/\1.md')
          ]

          found = possible_paths.any? { |p| File.exist?(p) }
          unless found
            puts "⚠️  Potentially broken link in '#{cat_id}': #{link['title']} -> #{link['url']}"
          end
        end
      end
    end
  end

  def list_categories
    puts "=== Available Categories ==="
    puts
    @categories.each do |cat_id, category|
      puts "#{cat_id}:"
      puts "  Title: #{category['title']}"
      puts "  Description: #{category['description']}"
      puts "  Links: #{category['links']&.size || 0}"

      # Show usage
      usage_count = @articles.count { |a| a[:categories].include?(cat_id) }
      puts "  Used in: #{usage_count} article#{'s' unless usage_count == 1}"
      puts
    end
  end

  def list_articles_by_category
    puts "=== Articles by Category ==="
    puts

    @categories.each do |cat_id, category|
      articles_in_category = @articles.select { |a| a[:categories].include?(cat_id) }

      puts "#{category['title']} (#{cat_id}):"
      if articles_in_category.any?
        articles_in_category.each do |article|
          puts "  - #{article[:title]} (#{article[:path]})"
        end
      else
        puts "  (no articles)"
      end
      puts
    end
  end

  def suggest_categories_for_orphaned_articles
    puts "=== Articles Without Categories ==="
    puts

    # Find articles that might benefit from categories
    Find.find('.') do |path|
      next unless path.end_with?('.md')
      next if path.include?('_site/') || path.include?('node_modules/')
      next if path == './README.md' || path.include?('category')

      content = File.read(path)
      if content.match(/^---\s*\n.*?^---\s*\n/m)
        front_matter = content.match(/^---\s*\n(.*?)^---\s*\n/m)[1]
        begin
          parsed = YAML.safe_load(front_matter, permitted_classes: [Date, Time])
          if parsed && !parsed['categories']
            title = parsed['title'] || File.basename(path, '.md')
            puts "📄 #{title} (#{path})"

            # Suggest categories based on path and content
            suggestions = suggest_categories_for_content(path, content.downcase)
            if suggestions.any?
              puts "   Suggested categories: #{suggestions.join(', ')}"
            end
            puts
          end
        rescue YAML::SyntaxError
          # Skip files with invalid YAML
        end
      end
    end
  end

  private

  def suggest_categories_for_content(path, content)
    suggestions = []

    # Path-based suggestions
    suggestions << 'computing_platforms' if path.include?('compute') || path.include?('cluster')
    suggestions << 'data_storage' if path.include?('store') || path.include?('storage')
    suggestions << 'software_development' if path.include?('software') || path.include?('python') || path.include?('r')
    suggestions << 'data_science' if path.include?('datascience') || path.include?('analysis')
    suggestions << 'security_compliance' if path.include?('security') || path.include?('phi') || path.include?('compliance')
    suggestions << 'access_credentials' if path.include?('access') || path.include?('credential')
    suggestions << 'bioinformatics' if path.include?('bio') || path.include?('genome') || path.include?('sequencing')

    # Content-based suggestions
    suggestions << 'computing_platforms' if content.include?('slurm') || content.include?('cluster') || content.include?('hpc')
    suggestions << 'data_storage' if content.include?('storage') || content.include?('database') || content.include?('s3')
    suggestions << 'software_development' if content.include?('python') || content.include?('programming') || content.include?('code')
    suggestions << 'bioinformatics' if content.include?('genomics') || content.include?('bioinformatics') || content.include?('sequencing')

    suggestions.uniq
  end
end

# Main script
if __FILE__ == $0
  manager = CategoryManager.new

  case ARGV[0]
  when 'validate'
    manager.validate_categories
  when 'list'
    manager.list_categories
  when 'articles'
    manager.list_articles_by_category
  when 'orphaned'
    manager.suggest_categories_for_orphaned_articles
  else
    puts "Category Manager for Fred Hutch Wiki"
    puts
    puts "Usage: ruby manage_categories.rb [command]"
    puts
    puts "Commands:"
    puts "  validate  - Check for undefined categories and broken links"
    puts "  list      - List all available categories"
    puts "  articles  - Show articles grouped by category"
    puts "  orphaned  - Find articles without categories and suggest some"
    puts
    puts "Examples:"
    puts "  ruby manage_categories.rb validate"
    puts "  ruby manage_categories.rb list"
  end
end
