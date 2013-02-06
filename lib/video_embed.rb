require 'video_embed/version'
require 'uri'

class VideoEmbed
  attr_reader :services

  autoload :YouTube, 'video_embed/youtube'
  autoload :Vimeo, 'video_embed/vimeo'
  autoload :NoService, 'video_embed/no_service'

  def initialize(services = nil)
    if services.nil?
      @services = default_services
    else
      @services = services
    end
  end

  def embed(url, options = {})
    if url.is_a? String
      url = URI.parse(url)
    end
    service = find_service_by_url(url)
    service.embed(url, options)
  end

  def self.embed(url, options = {})
    video_embed = new
    video_embed.embed(url, options)
  end

  private

  def find_service_by_url(url)
    services.find { |s| s.url?(url) }
  end

  def default_services
    [YouTube.new, Vimeo.new, NoService.new]
  end
end

