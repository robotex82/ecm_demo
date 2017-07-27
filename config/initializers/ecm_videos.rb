Ecm::Videos.configure do |config|
  # Accepted markup languages
  #
  # default: config.markup_languages = %w[ textile ]
  config.markup_languages = %w( textile )

  # Default markup language
  #
  # default: config.default_markup_language = 'textile'
  config.default_markup_language = 'textile'

  # Set the base controller
  #
  # Default: config.base_controller = 'FrontendController'
  #
  config.base_controller = 'FrontendController'

  # Set the paperclip options. This should be a proc. The proc
  # takes one parameter: The video model.
  #
  # Default: config.paperclip_options = Proc.new do |model|
  #            {
  #              styles: {
  #                small_thumb:   '80x60',
  #                medium_thumb:  '160x120',
  #                default_thumb: '260x180'
  #              }
  #            }
  #          end
  #
  config.paperclip_options = proc do |_model|
    {
      styles: {
          # :medium       => { :geometry => "640x480", :format => 'flv' },
          small_thumb:  { geometry: '80x60',   format: 'jpg', time: 10 },
          medium_thumb: { geometry: '160x120', format: 'jpg', time: 10 },
          small_thumb:  { geometry: '260x180', format: 'jpg', time: 10 }
      },
      processors: [:transcoder]
    }
  end
end
