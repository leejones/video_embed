require 'cgi'

class VideoEmbed
  class YouTube
    def url?(url)
      url.host =~ /(:?youtube\.com|youtu.be)/
    end

    def embed(url, options = {})
      youtube_url = YouTube::Url.new(url, options)
      youtube_url.embed
    end

    class Url
      attr_reader :url, :width, :height

      def initialize(url, options = {})
        @url = url
        @width = options.fetch(:width, 560)
        @height = options.fetch(:height, 315)
      end

      def embed
        view_path = File.join(File.dirname(__FILE__),"../views/video/video_iframe.haml")
        url = "https://www.youtube.com/embed/#{video_id}?rel=0"
        Haml::Engine.new(File.read(view_path)).render(Object.new, url: url, height: @height, width: @width)
      end

      private
      
      def video_id
        if short_url?
          url.path.match(/\/(.*)\??/)[1]
        else
          params = CGI.parse(url.query)
          params['v'].first
        end
      end

      def short_url?
        url.host == 'youtu.be'
      end
    end
  end
end

