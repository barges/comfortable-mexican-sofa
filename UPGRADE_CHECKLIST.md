# Quick Upgrade Checklist for Rails 7.1

Use this checklist when upgrading your application to use ComfortableMexicanSofa with Rails 7.1.

## Prerequisites

- [ ] **Ruby 3.0+** installed and active
- [ ] **Rails 7.1+** in your application

## Required Changes

### 1. Update Gemfile
```ruby
gem "rails", "~> 7.1.0"
gem "comfortable_mexican_sofa", "~> 2.1.0"  # or latest
```

### 2. Update Application Config
```ruby
# config/application.rb
config.load_defaults 7.1
```

### 3. If You Use MimeMagic Directly
```ruby
# Old
MimeMagic.by_magic(file)

# New
Marcel::MimeType.for(file)
```

### 4. If You Call ActiveStorage Variants
```ruby
# Old
file.variant(combine_options: { resize: "100x75" })

# New
file.variant(transform: { resize: "100x75" })
# OR
file.variant(resize_to_limit: [100, 75])
```

### 5. If You Have YAML Serialized Columns
```ruby
# Old
serialize :data

# New
serialize :data, coder: YAML
```

### 6. If You Use Mocha in Tests
```ruby
# test/test_helper.rb
# Old: require "mocha/setup"
# New:
require "mocha/minitest"
```

## Optional: If Using Sprockets with Sass
```ruby
# Only if you need sassc for other parts of your app
gem "sassc", "~> 2.4", group: :development
```

## After Upgrading

1. [ ] Run `bundle update comfortable_mexican_sofa rails`
2. [ ] Run `rails db:migrate`
3. [ ] Test CMS functionality:
   - [ ] Admin area loads
   - [ ] Can create/edit pages
   - [ ] File uploads work
   - [ ] Image thumbnails display
   - [ ] CMS seeds work

## Need Help?

See [RAILS_7_1_MIGRATION_GUIDE.md](RAILS_7_1_MIGRATION_GUIDE.md) for detailed instructions.

