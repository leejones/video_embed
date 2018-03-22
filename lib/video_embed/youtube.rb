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
      attr_reader :url, :width, :height, :start_time

      def initialize(url, options = {})
        @url = url
        @width = options.fetch(:width, 560)
        @height = options.fetch(:height, 315)
        @start_time = options.fetch(:start_time, 0)
      end

      def embed
        %Q{<iframe width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{video_id}?rel=0&start=#{start_time}" frameborder="0" allowfullscreen></iframe>}
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

