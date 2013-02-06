class VideoEmbed
  class NoService 
    def url?(url)
      true
    end

    def embed(url, options = {})
      '<p>Video embed not available.</p>'
    end
  end
end
