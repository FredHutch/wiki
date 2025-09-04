# Category Boxes System

This document describes the Wikipedia-style category boxes system implemented for the Fred Hutch Wiki.

## Overview

Category boxes are visual elements that appear at the bottom of articles, helping readers discover related content and navigate between topics. They mimic Wikipedia's category system but are specifically tailored for our scientific computing and data science wiki.

## Quick Start

### For Article Authors

1. Add categories to your article's front matter:
   ```yaml
   ---
   title: Your Article Title
   layout: single_with_categories
   categories: ["computing_platforms", "data_storage"]
   ---
   ```

2. Your article will automatically display relevant category boxes at the bottom.

### For Category Managers

1. Edit category definitions in `_data/categories.yml`
2. Each category includes title, description, color, and related links
3. Changes take effect on next site build

## System Architecture

### Files Structure

```
wiki/
├── _data/
│   └── categories.yml              # Category definitions (EDIT THIS)
├── _includes/
│   └── category_box.html           # Rendering template
├── _layouts/
│   └── single_with_categories.html # Auto-includes categories
├── _scripts/
│   └── manage_categories.rb        # Management utilities
└── CATEGORY_BOXES_README.md        # This file
```

### How It Works

1. **Category Definitions**: All categories are defined centrally in `_data/categories.yml`
2. **Article Association**: Articles reference categories by ID in their front matter
3. **Automatic Rendering**: The `category_box.html` include renders appropriate boxes
4. **Styling**: Inline CSS ensures compatibility and responsive design

## Available Categories

| Category ID | Topic | Color |
|-------------|-------|-------|
| `computing_platforms` | HPC, cloud computing, computational resources | Light blue |
| `data_storage` | Data storage, management, access | Light purple |
| `software_development` | Programming, development tools, coding | Light green |
| `data_science` | Data analysis, visualization, workflows | Light orange |
| `security_compliance` | Privacy, security, regulatory compliance | Light red |
| `access_credentials` | Authentication, permissions, system access | Light lime |
| `bioinformatics` | Genomics, proteomics, biological data analysis | Light teal |

## Usage Examples

### Basic Usage
```yaml
---
title: "Cluster Computing Guide"
layout: single_with_categories
categories: ["computing_platforms"]
---
```

### Multiple Categories
```yaml
---
title: "Secure Data Analysis Workflows"
layout: single_with_categories
categories: ["data_science", "security_compliance", "computing_platforms"]
---
```

### Manual Include (if using different layout)
```markdown
---
title: "Your Article"
layout: custom_layout
categories: ["bioinformatics"]
---

Your article content here...

{% include category_box.html %}
```

## Managing Categories

### Adding a New Category

Edit `_data/categories.yml`:

```yaml
new_category_id:
  title: "New Category Name"
  description: "Brief description of the category scope"
  color: "#f0f8ff"  # Light color for readability
  links:
    - title: "Related Article 1"
      url: "/path/to/article1/"
    - title: "Related Article 2"
      url: "/path/to/article2/"
```

### Updating Existing Categories

1. Modify the appropriate section in `_data/categories.yml`
2. Update title, description, color, or links as needed
3. Save and the changes will appear on next build

### Best Practices

- **Limit categories per article**: Use 1-3 most relevant categories
- **Keep links current**: Regularly review and update category links
- **Use descriptive titles**: Make link titles clear and consistent
- **Choose appropriate colors**: Use light, muted colors for readability
- **Maintain relevance**: Ensure category links genuinely relate to the topic

## Management Tools

### Category Management Script

Use `_scripts/manage_categories.rb` for maintenance:

```bash
# Validate all categories and links
ruby _scripts/manage_categories.rb validate

# List all available categories
ruby _scripts/manage_categories.rb list

# Show articles grouped by category
ruby _scripts/manage_categories.rb articles

# Find articles without categories
ruby _scripts/manage_categories.rb orphaned
```

### Common Maintenance Tasks

1. **Monthly Review**: Run validation to check for broken links
2. **Content Audit**: Review unused categories and orphaned articles
3. **Link Updates**: Update category links when articles are moved or renamed
4. **Category Expansion**: Add new categories as content areas grow

## Styling and Customization

### Color Scheme

Categories use a light color palette for accessibility:
- Computing: `#e3f2fd` (light blue)
- Storage: `#f3e5f5` (light purple)
- Development: `#e8f5e8` (light green)
- Data Science: `#fff3e0` (light orange)
- Security: `#ffebee` (light red)
- Access: `#f1f8e9` (light lime)
- Bioinformatics: `#e0f2f1` (light teal)

### Responsive Design

Category boxes automatically adapt to mobile devices:
- Desktop: Inline link buttons
- Mobile: Full-width stacked buttons
- All sizes: Proper contrast and readability

### Custom Styling

To customize appearance, edit `_includes/category_box.html`:
- Modify inline styles for immediate changes
- Add CSS classes for theme integration
- Adjust responsive breakpoints as needed

## Troubleshooting

### Category Box Not Appearing

1. Check front matter syntax: `categories: ["category_id"]`
2. Verify category ID exists in `_data/categories.yml`
3. Ensure using `layout: single_with_categories` or manual include
4. Confirm Jekyll is processing the file (not in `_config.yml` exclude list)

### Links Not Working

1. Verify URLs in category definitions
2. Check that target articles exist
3. Use correct relative URL format (`/collection/article/`)
4. Test links after site builds

### Styling Issues

1. Check color codes are valid CSS hex values
2. Test on different screen sizes
3. Verify no CSS conflicts with theme
4. Clear browser cache after style changes

## Integration with Existing Workflow

### Git Workflow

1. Edit categories: Modify `_data/categories.yml`
2. Update articles: Add `categories` to front matter
3. Test locally: Build site and verify appearance
4. Commit changes: Include both category and article updates
5. Deploy: Changes appear after site rebuild

### Content Strategy

- **New articles**: Consider categories during writing process
- **Existing articles**: Gradually add categories during content reviews
- **Category planning**: Align categories with site navigation and user needs
- **Link maintenance**: Include category links in content review cycles

## Performance Considerations

- **Build time**: Categories are processed at build time (no runtime cost)
- **Page weight**: Minimal CSS and HTML overhead
- **Caching**: Category boxes are static content, cache-friendly
- **Scalability**: System handles hundreds of articles and categories efficiently

## Future Enhancements

Potential improvements to consider:
- **Tag integration**: Combine with Jekyll tags for enhanced organization
- **Auto-categorization**: Suggest categories based on content analysis
- **Category statistics**: Track usage and popularity metrics
- **Advanced styling**: Theme integration and customization options
- **Cross-references**: Show related articles within same categories

## Support and Maintenance

For questions or issues:
1. Check this documentation
2. Run validation script to identify problems
3. Review `_data/categories.yml` for consistency
4. Ask in #wiki Slack channel
5. Create GitHub issue for bugs or feature requests

---

**System Version**: 1.0  
**Last Updated**: December 2024  
**Maintainer**: Scientific Computing Team