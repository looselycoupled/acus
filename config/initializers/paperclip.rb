# This file sets default configuration for Paperclip attached files
# You can override any of these settings on a per-attachment basis
# by adding the setting to the has_attached_file hash in the model definition

# Use Amazon S3 to store files
Paperclip::Attachment.default_options[:storage] = :s3

# The bucket name and AWS keys come from the environment
Paperclip::Attachment.default_options[:bucket] = ENV.fetch("S3_BUCKET_NAME")
Paperclip::Attachment.default_options[:s3_credentials] = {
  access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID"),
  secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY"),
}

# By default, serve all images over HTTPS. You can specify HTTP here,
# or set an empty string, meaning to use // as the protocol for files,
# so it will scheme-match either HTTPS or HTTP
Paperclip::Attachment.default_options[:s3_protocol] = ""

# By default individual files are publicly readable
Paperclip::Attachment.default_options[:s3_permissions] = :public_read

# The symbol-string here means the default domain URL to a file will
# be https://my-bucket-name.s3.amazonaws.com/
Paperclip::Attachment.default_options[:url] = ":s3_domain_url"

# The default path to a file is interpolated with:
# class      -> the tableize'd name of the model (see String#tableize)
# id         -> the ID of the object
# attachment -> the name of the attached file field
# style      -> the thumbnail/export style name
# extension  -> the file extension
Paperclip::Attachment.default_options[:path] = ":class/:id/:attachment/:style.:extension"

