class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [200, 200, 'Center']

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    'user.png'
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :thumb24 do
    process resize_to_fit: [24, 24]
  end

  version :thumb32 do
    process resize_to_fit: [32, 32]
  end
  
  version :thumb40 do
    process resize_to_fit: [40, 40]
  end

  version :thumb48 do
    process resize_to_fill: [48, 48]
  end

  version :thumb56 do
    process resize_to_fit: [56, 56]
  end

  version :thumb64 do
    process resize_to_fit: [64, 64]
  end

  version :thumb120 do
    process resize_to_fit: [120, 120]
  end

  # Add an allowlist of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_allowlist
     %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def filename
    "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end

end
