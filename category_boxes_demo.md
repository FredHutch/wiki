---
title: "Category Boxes Demo"
layout: single_with_categories
categories: ["computing_platforms", "data_science", "software_development"]
toc: true
toc_label: "On This Page"
toc_sticky: true
---

# Category Boxes Demonstration

This demo article showcases the Wikipedia-style category boxes system implemented for the Fred Hutch Wiki. The category boxes will appear at the bottom of this page, demonstrating how they help readers discover related content.

## What You'll See

At the bottom of this page, you'll find three category boxes:

1. **Computing Platforms** - Links to HPC, cloud computing, and computational resources
2. **Data Science** - Links to data analysis, visualization, and scientific workflows  
3. **Software Development** - Links to programming languages, development tools, and coding practices

## How It Works

### For Article Authors

To add category boxes to any article, simply:

1. Add `layout: single_with_categories` to your front matter
2. Include a `categories` array with the desired category IDs
3. The category boxes will automatically appear at the bottom

Example front matter:
```yaml
---
title: "Your Article Title"
layout: single_with_categories
categories: ["computing_platforms", "data_science"]
---
```

### For Category Managers

Categories are defined centrally in `_data/categories.yml`. Each category includes:

- **Title** - Display name for the category
- **Description** - Brief explanation of the category scope
- **Color** - Background color for visual distinction
- **Links** - Array of related articles and resources

## Benefits

Category boxes provide several advantages:

- **Discoverability** - Help readers find related content
- **Navigation** - Easy movement between related topics
- **Organization** - Thematic grouping of wiki content
- **Consistency** - Standardized way to show relationships
- **Maintenance** - Centralized category management

## Visual Design

The category boxes feature:

- **Color coding** - Each category has a unique light background color
- **Responsive design** - Adapts to mobile and desktop screens
- **Clear typography** - Easy-to-read titles and descriptions
- **Hover effects** - Interactive feedback for links
- **Accessibility** - Proper contrast and semantic structure

## Management Tools

The wiki includes a Ruby script (`_scripts/manage_categories.rb`) for:

- **Validation** - Check for undefined categories and broken links
- **Listing** - Show all available categories and their usage
- **Analysis** - Find articles without categories
- **Maintenance** - Identify unused categories

Run the management script with:
```bash
ruby _scripts/manage_categories.rb validate
ruby _scripts/manage_categories.rb list
ruby _scripts/manage_categories.rb articles
```

## Integration

The category system integrates seamlessly with:

- **Jekyll collections** - Works with all wiki sections
- **Minimal Mistakes theme** - Maintains consistent styling
- **Existing workflows** - No changes to current editing process
- **Site navigation** - Complements existing menu structure

## Testing

To verify category boxes work correctly:

1. **Visual check** - Look for boxes at the bottom of this page
2. **Link testing** - Click links to ensure they navigate properly
3. **Responsive test** - View on mobile devices
4. **Validation** - Run the management script

## Next Steps

After implementing category boxes:

1. **Gradual rollout** - Add categories to high-traffic articles first
2. **Content review** - Identify articles that would benefit from categorization
3. **Category expansion** - Add new categories as content areas grow
4. **User feedback** - Monitor how readers use the category system

---

**Note**: The category boxes below are automatically generated based on the categories specified in this article's front matter. They demonstrate the actual functionality you'll see throughout the wiki.