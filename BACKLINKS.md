# Backlinks Feature

This document describes the "What Links Here" backlinks feature that has been added to the wiki.

## Overview

The backlinks feature automatically generates pages that show which pages link to a given page, similar to Wikipedia's "What links here" functionality. This helps users discover related content and understand the connections between pages in the wiki.

## How It Works

### 1. Link Detection
The system scans all markdown files in the wiki and extracts:
- Markdown links in the format `[text](/path/to/page/)`
- Reference-style links `[text]: /path/to/page/`

### 2. Backlink Page Generation
For each page that has incoming links, a corresponding backlink page is automatically generated at `/backlinks/path/to/original/page/`.

### 3. User Interface
Each page now includes a "What Links Here" link in the social sharing section at the bottom, next to the existing "Edit this Page" and "Comment" links.

## Implementation Details

### Files Added/Modified

- `generate_backlinks.rb` - Ruby script that analyzes all markdown files and generates backlink pages
- `build.sh` - Main build script that runs the backlinks generator before Jekyll build
- `_includes/social-share.html` - Modified to include the "What Links Here" link
- `_config.yml` - Added backlinks collection configuration
- `_data/backlinks.yml` - Generated data file containing backlink information
- `_backlinks/` - Directory containing generated backlink pages (Jekyll collection)

### Jekyll Configuration

The backlinks are implemented as a Jekyll collection:

```yaml
collections:
  backlinks:
    output: true
    permalink: /backlinks/:path/
```

### Build Process

The recommended build process is:

**For development (serves locally):**
```bash
./build.sh
```

**For production (builds only):**
```bash
./build.sh build
```

This script:
1. Runs the backlinks generator (`ruby generate_backlinks.rb`)
2. Updates dependencies and installs gems
3. Either builds the Jekyll site or serves it locally on port 7979

### Backlinks Generator

The `generate_backlinks.rb` script:
- Scans all markdown files in collections (`_*/*.md`) and root directory (`*.md`)
- Extracts links using regex patterns
- Builds a reverse index of which pages link to which other pages
- Generates markdown files for backlink pages
- Saves summary data to `_data/backlinks.yml`

## Usage

### For Content Authors

When writing content, simply use normal markdown links:
```markdown
[Docker](/compdemos/Docker/)
[Computing Environments](/scicomputing/compute_environments/)
```

The backlinks will be automatically generated when the site is built.

### For Site Visitors

1. Navigate to any page in the wiki
2. Scroll to the bottom of the page
3. Click the "What Links Here" link (🔗) in the sharing section
4. View the automatically generated list of pages that link to the current page

### Example

If you're reading the Docker page (`/compdemos/Docker/`) and click "What Links Here", you'll be taken to `/backlinks/compdemos/Docker/` which shows:

- **Linking Pages (3)**
  - Using AWS Batch - SciComp provides direct access to AWS Batch in two ways:...
  - PROOF Troubleshooting - proof.fredhutch.org on the Fred Hutch Network...
  - Computing Environments and Containers - The Fred Hutch provides researchers...

## Limitations

- Only processes markdown files (`.md`)
- Only detects standard markdown links and reference-style links
- External links (HTTP/HTTPS) are excluded
- Self-references are excluded
- Generated pages are automatically updated on each build
- Backlinks pages are excluded from search results to avoid cluttering search
- Automatically deduplicates multiple links from the same page to the same target

## Navigation Integration

The backlinks generator automatically creates backlinks pages for all pages referenced in the site's navigation (`_data/navigation.yml`), even if those pages have no incoming content links. This prevents 404 errors when Jekyll tries to access backlinks for navigation-referenced pages.

## Search Exclusion

All backlinks pages are automatically excluded from the site's search results by setting `search: false` in their frontmatter. This prevents the automatically-generated "What Links Here" pages from cluttering search results, ensuring users only find actual content pages when searching.

## Troubleshooting

### Backlinks Not Appearing

1. Ensure you're running `./build.sh` instead of just `jekyll build`
2. Check that the page actually has incoming links from other pages
3. Verify that links are in standard markdown format

### Build Errors

1. Check Ruby script output for warnings about problematic files
2. Ensure all markdown files have valid YAML frontmatter
3. Check file permissions for the `_backlinks/` directory

### Missing Links

1. Verify that links use absolute paths starting with `/`
2. Ensure target pages actually exist
3. Check that source pages are being processed (not in excluded directories)

### 404 Errors for Backlinks Pages

If you see 404 errors like `/backlinks/path/to/page/' not found`, this usually means:
1. The page exists but has no incoming links (navigation-only pages are now handled automatically)
2. There are malformed URLs in your content (e.g., `/_collection/page.md` instead of `/collection/page/`)
3. Old cached URLs or bookmarks pointing to pages that no longer exist

### Redirect Pages

The system automatically handles redirect pages (pages with `permalink` overrides in their frontmatter):
- Creates backlinks pages for both the permalink URL (e.g., `/hdc/hdc_index/`) and Jekyll's internal URL (e.g., `/redirect_hdc_index/`)
- This ensures the "What Links Here" functionality works regardless of which URL is used by Jekyll's templating system
- Prevents 404 errors when Jekyll uses the filename-based URL instead of the permalink URL

### Social Sharing Pages

The system automatically creates backlinks pages for all pages that have social sharing enabled (which includes the "What Links Here" link):
- Pages in collections with `share: true` in their defaults (like `_scicompannounce`, `_compdemos`, etc.)
- Individual pages with `share: true` in their frontmatter
- This prevents 404 errors when users click "What Links Here" on pages that have no incoming links
- Such pages show "Linking Pages (0)" indicating no other pages link to them

### Deduplication

If a page contains multiple links to the same target page, only one backlink entry is created for that source page. For example:
- If `page-a.md` contains 3 different links to `page-b.md`, only one entry for "Page A" appears in the backlinks for "Page B"
- This prevents cluttered backlinks pages with duplicate entries from the same source
- Each source page appears only once per target page, regardless of how many links it contains

### YAML Safety

The system automatically escapes special characters (like quotes) in page titles to prevent YAML parsing errors in the generated backlinks pages.

## Maintenance

The backlinks are regenerated on each build, so they stay automatically up-to-date as content changes. No manual maintenance is required.

The generated `_backlinks/` directory and `_data/backlinks.yml` file can be safely deleted - they will be regenerated on the next build.

## Performance

- Processing time scales with the number of markdown files
- Typical processing time: ~2-5 seconds for 400+ files
- Generated backlink pages are cached by Jekyll like any other pages
- No runtime performance impact on the live site