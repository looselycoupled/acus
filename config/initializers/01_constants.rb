# 01_constants.rb will always be run before any other initalizers
# Add global constants to the Rails app here
# You should configure enviroments in the config/application.rb and config/enviroments

# This would be availabe at Rails.configuration.your_constant
# Rails.configuration.your_constant = "#d4034f"

# Alernatively you can just do a REGULAR_CONSTANT
# YOUR_CONSTANT = "#d4034f"

Shortline.set_application_constants do |const|

  # Used to evaluate file uploads when images are required.
  const.valid_image_types = %w[
    image/jpeg
    image/jpg
    image/pjpeg
    image/png
    image/x-png
  ]
  
  # Provides a maximum allowed image size when uploading images
  const.maximum_image_size = 5.megabytes

  # These slugs cann't be used as a page slug because
  # they're required by the Rails router
  const.reserved_slugs = %w[
    400
    404
    422
    500
    503
    admin
    delete
    edit
    index
    show
  ]

end
