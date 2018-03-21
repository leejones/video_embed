require File.expand_path('../../lib/video_embed.rb', __FILE__)

describe VideoEmbed do
  describe 'YouTube' do
    it 'returns embed html from a url' do
      video_embed = VideoEmbed.embed('http://www.youtube.com/watch?v=4Z3r9X8OahA&feature=fvwp&NR=1')
      expect(video_embed).to match(/iframe/)
      expect(video_embed).to include('https://www.youtube.com/embed/4Z3r9X8OahA?rel=0')
    end

    it 'returns embed html from a short url' do
      video_embed = VideoEmbed.embed('http://youtu.be/4Z3r9X8OahA')
      expect(video_embed).to include('https://www.youtube.com/embed/4Z3r9X8OahA?rel=0')
    end

    it 'accepts a custom width' do
      video_embed = VideoEmbed.embed('http://www.youtube.com/watch?v=NtgtMQwr3Ko', :width => 1280)
      expect(video_embed).to match(/width='1280'/) 
    end

    it 'accepts a custom height' do
      video_embed = VideoEmbed.embed('http://www.youtube.com/watch?v=NtgtMQwr3Ko', :height => 720)
      expect(video_embed).to match(/height='720'/) 
    end
  end

  describe 'Vimeo' do
    it 'returns embed html from a url' do
      video_embed = VideoEmbed.embed('http://vimeo.com/11040425')
      expect(video_embed).to match(/iframe/)
      expect(video_embed).to include('https://player.vimeo.com/video/11040425')
    end

    it 'returns embed html from a mobile url' do
      video_embed = VideoEmbed.embed('http://vimeo.com/m/11040425')
      expect(video_embed).to include('https://player.vimeo.com/video/11040425')
    end

    it 'returns embed html from an album url' do
      video_embed = VideoEmbed.embed('http://vimeo.com/album/2590693/video/78279754')
      expect(video_embed).to include('https://player.vimeo.com/video/78279754')
    end

    it 'returns embed html from a channel url' do
      video_embed = VideoEmbed.embed('https://vimeo.com/channels/staffpicks/107469289')
      expect(video_embed).to include('https://player.vimeo.com/video/107469289')
    end

    it 'accepts a custom width' do
      video_embed = VideoEmbed.embed('http://vimeo.com/11040425', :width => 720)
      expect(video_embed).to match(/width='720'/) 
    end

    it 'accepts a custom height' do
      video_embed = VideoEmbed.embed('http://vimeo.com/11040425', :height => 480)
      expect(video_embed).to match(/height='480'/) 
    end
  end

  describe 'Fallback' do
    it 'returns an empty string when not a supported service' do
      video_embed = VideoEmbed.embed('http://example.com/')
      expect(video_embed).to eql(%Q{<p>Video embed not available.</p>})
    end
  end
end

