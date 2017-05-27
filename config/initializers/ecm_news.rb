Ecm::News.configure do |config|
  # Number of lines to render in news preview
  #
  # default: config.news_item_preview_lines = 3
  config.news_item_preview_lines = 3

  # Number of items that will be shown in #render_news
  #
  # default: config.render_news_default_count = 2
  config.render_news_default_count = 2

  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ textile ]
  config.markup_languages = %w( textile )

  # Default markup language
  #
  # default: config.default_markup_language = 'textile'
  config.default_markup_language = 'textile'

  # Show or hide the publishing time for news
  #
  # Default: config.show_publish_time = true
  config.show_publish_time = true

  # CSS Classes for the preview container div
  #
  # Default: config.news_item_preview_div_classes = 'media ecm-news-item bottom-margin-2'
  #
  config.news_item_preview_div_classes = 'media ecm-news-item bottom-margin-2'

  # CSS Classes for the preview thumbnail link
  #
  # Default: config.news_item_preview_thumbnail_link_classes = 'col-lg-4'
  #
  config.news_item_preview_thumbnail_link_classes = 'col-lg-4'

  # Set the base controller for the contact form
  #
  # Default: config.base_controller = 'ApplicationController'
  #
  config.base_controller = 'ApplicationController'

  # Adds <notextile> tags around the to fix html output.
  #
  # Default: config.prevent_textile_rendering_in_html = true
  #
  config.prevent_textile_rendering_in_html = true
end
