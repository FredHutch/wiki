---
title: Category Boxes Guide
layout: single
toc: true
toc_label: "On This Page"
toc_sticky: true
---

# Category Boxes Guide

This guide explains how to use Wikipedia-style category boxes on the Fred Hutch Wiki. Category boxes help readers discover related articles and navigate between topics more easily.

## What are Category Boxes?

Category boxes are visual elements that appear at the bottom of articles, showing related links grouped by topic. They look similar to Wikipedia's category boxes and help organize content thematically.

## For Article Authors

### Adding Categories to Your Article

To add category boxes to your article, simply add a `categories` field to your article's front matter:

```yaml
---
title: Your Article Title
categories: ["computing_platforms", "data_storage"]
---
```

### Available Categories

The following categories are currently available:

- `computing_platforms` - High-performance computing, cloud computing, computational resources
- `data_storage` - Data storage, management, and access methods
- `software_development` - Programming languages, development tools, coding practices
- `data_science` - Data analysis, visualization, scientific workflows
- `security_compliance` - Data privacy, security, regulatory compliance
- `access_credentials` - Authentication, permissions, system access
- `bioinformatics` - Genomics, proteomics, biological data analysis

### Using the Category Layout

To automatically include category boxes in your article, use the `single_with_categories` layout:

```yaml
---
title: Your Article Title
layout: single_with_categories
categories: ["computing_platforms", "software_development"]
---
```

Alternatively, if you need to use a different layout, you can manually include category boxes at the bottom of your article:

```liquid
{% include category_box.html %}
```

## For Category Editors

### Editing Category Definitions

Category definitions are stored in `_data/categories.yml`. Each category has:

- **id**: Unique identifier used in article front matter
- **title**: Display name for the category
- **description**: Brief explanation of what the category covers
- **color**: Background color for the category box (CSS hex color)
- **links**: Array of related articles and their URLs

### Adding a New Category

To add a new category, edit `_data/categories.yml`:

```yaml
new_category_id:
  title: "Category Display Name"
  description: "Brief description of what this category covers"
  color: "#f0f8ff"  # Light blue
  links:
    - title: "Related Article 1"
      url: "/path/to/article1/"
    - title: "Related Article 2"
      url: "/path/to/article2/"
```

### Modifying Existing Categories

To update a category:

1. Edit the appropriate section in `_data/categories.yml`
2. Modify the title, description, color, or links as needed
3. Save the file - changes will appear on the next site build

### Color Guidelines

Use light, muted colors for category boxes to ensure readability:
- Light blue: `#e3f2fd`
- Light purple: `#f3e5f5`
- Light green: `#e8f5e8`
- Light orange: `#fff3e0`
- Light red: `#ffebee`
- Light lime: `#f1f8e9`
- Light teal: `#e0f2f1`

## Best Practices

### For Authors

1. **Be selective**: Choose 1-3 most relevant categories per article
2. **Stay consistent**: Use established categories rather than requesting new ones frequently
3. **Think about readers**: Choose categories that help readers find related content
4. **Test locally**: Preview your article to ensure category boxes render correctly

### For Category Maintainers

1. **Keep links current**: Regularly review and update links in category definitions
2. **Maintain relevance**: Ensure category links are genuinely related to the category topic
3. **Limit link count**: Keep 4-8 links per category for optimal usability
4. **Use clear titles**: Make link titles descriptive and consistent with article titles
5. **Coordinate changes**: Discuss major category restructuring with the wiki team

## Technical Details

### File Structure

```
wiki/
├── _data/
│   └── categories.yml          # Category definitions
├── _includes/
│   └── category_box.html       # Category box template
├── _layouts/
│   └── single_with_categories.html  # Layout with automatic categories
└── articles with categories...
```

### Styling

Category boxes use inline CSS for maximum compatibility. They are:
- Responsive (adapt to mobile devices)
- Accessible (proper color contrast)
- Consistent with site design
- Lightweight (no external dependencies)

### Performance

- Category boxes are generated at build time (no client-side JavaScript)
- Minimal CSS impact
- Fast loading and rendering

## Troubleshooting

### Category Box Not Appearing

1. Check that your article's front matter includes a `categories` field
2. Verify category IDs match those in `_data/categories.yml` exactly
3. Ensure you're using `layout: single_with_categories` or including `{% include category_box.html %}`

### Links Not Working

1. Verify URLs in `_data/categories.yml` are correct
2. Check that target articles exist
3. Ensure URLs use the correct relative path format

### Styling Issues

1. Test on different screen sizes
2. Verify color codes are valid CSS hex colors
3. Check for any custom CSS conflicts

## Getting Help

For questions about category boxes:
1. Check this documentation first
2. Ask in the #wiki channel on Slack
3. Create an issue in the wiki GitHub repository
4. Contact the Scientific Computing team

---

*Last updated: {{ site.time | date: "%B %d, %Y" }}*