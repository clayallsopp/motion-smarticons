unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require 'RMagick'

class SmartIconsConfig
  attr_accessor :text

  def initialize(config)
    @config = config
  end

  def build!
    create_icons
  end

  def text
    return @text if @text

    default_text
  end

  def default_text
    commit = `git rev-parse --short HEAD`.strip
    branch=`git rev-parse --abbrev-ref HEAD`
    app_version = @config.version
    "#{app_version} #{branch} #{commit}"
  end

  private
  def create_icons
    icons = @config.icons
    files = icons.map {|i|
      [File.join(@config.resources_dirs, i),
        File.join(@config.resources_dirs, "_smart_#{i}")]
    }

    files.each do |file, new_file|
      icon = Magick::ImageList.new.from_blob(open(file) {|f| f.read}) {
        self.gravity = Magick::SouthGravity
      }.first

      caption = Magick::Image.read("caption:#{self.text}") {
        self.fill = "white"
        self.background_color = "#0008"
        height = (icon.rows * 0.35).to_i
        self.size = "#{icon.columns}x#{height}"
        self.gravity = Magick::CenterGravity
      }.first

      new_icon = icon.composite(caption, Magick::SouthGravity, 0, 0, Magick::AtopCompositeOp)

      new_icon.write(new_file)
    end

    @config.icons = files.map {|f| File.split(f.last)[-1]}
  end
end

module Motion; module Project; class Config
  def smarticons!
    @smarticons ||= SmartIconsConfig.new(self)
    @smarticons.build!
  end

  def smarticons
    @smarticons ||= SmartIconsConfig.new(self)
  end

  def smarticons=(string)
    @smarticons ||= SmartIconsConfig.new(self)
    @smarticons.text = string
    @smarticons.build!
  end

end; end; end