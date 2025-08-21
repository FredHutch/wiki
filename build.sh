#!/bin/bash

# This script builds the Jekyll site with backlinks generation
# Usage:
#   ./build.sh          - Generate backlinks and build site
#   ./build.sh serve    - Generate backlinks and serve site locally
#   ./build.sh --help   - Show help

set -e

show_help() {
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  (none)    Generate backlinks and serve the site locally on port 7979"
    echo "  build     Generate backlinks and build the Jekyll site"
    echo "  --help    Show this help message"
    echo ""
    echo "This script:"
    echo "  1. Generates backlinks for 'What Links Here' functionality"
    echo "  2. Updates bundle and installs dependencies"
    echo "  3. Builds or serves the Jekyll site"
}

generate_backlinks() {
    echo "🔗 Generating backlinks..."
    ruby generate_backlinks.rb
    echo "✅ Backlinks generated"
}

setup_dependencies() {
    echo "📦 Setting up dependencies..."
    bundle update
    gem install bundler:2.3.5
    gem install -g Gemfile
    bundle install
    echo "✅ Dependencies ready"
}

# Parse command line arguments
case "${1:-}" in
    --help|-h)
        show_help
        exit 0
        ;;
    build)
        echo "🏗️ Building site with backlinks..."
        generate_backlinks
        setup_dependencies
        echo "🔨 Building Jekyll site..."
        bundle exec jekyll build
        echo "✅ Build complete!"
        ;;
    "")
        echo "🚀 Building and serving site with backlinks..."
        generate_backlinks
        setup_dependencies
        echo "🌐 Starting Jekyll server on http://0.0.0.0:7979"
        bundle exec jekyll serve -H 0.0.0.0 -P 7979
        ;;
    *)
        echo "Error: Unknown command '$1'"
        echo ""
        show_help
        exit 1
        ;;
esac
