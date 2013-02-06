require File.expand_path('../../lib/video_embed.rb', __FILE__)

describe VideoEmbed do
  describe 'YouTube' do
    it 'returns embed html from a url' do
      video_embed = VideoEmbed.embed('http://www.youtube.com/watch?v=4Z3r9X8OahA&feature=fvwp&NR=1')
      video_embed.should eql(%Q{<iframe width="560" height="315" src="http://www.youtube.com/embed/4Z3r9X8OahA?rel=0" frameborder="0" allowfullscreen></iframe>})
    end

    it 'returns embed html from a short url' do
      video_embed = VideoEmbed.embed('http://youtu.be/4Z3r9X8OahA')
      video_embed.should include('http://www.youtube.com/embed/4Z3r9X8OahA?rel=0')
    end

    it 'accepts a custom width' do
      video_embed = VideoEmbed.embed('http://www.youtube.com/watch?v=NtgtMQwr3Ko', :width => 1280)
      video_embed.should match(/width="1280"/) 
    end

    it 'accepts a custom height' do
      video_embed = VideoEmbed.embed('http://www.youtube.com/watch?v=NtgtMQwr3Ko', :height => 720)
      video_embed.should match(/height="720"/) 
    end
  end

  describe 'Vimeo' do
    it 'returns embed html from a url' do
      video_embed = VideoEmbed.embed('http://vimeo.com/11040425')
      video_embed.should eql(%Q{<iframe src="http://player.vimeo.com/video/11040425?title=0&amp;byline=0&amp;portrait=0" width="560" height="315" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>})
    end

    it 'returns embed html from a mobile url' do
      video_embed = VideoEmbed.embed('http://vimeo.com/m/11040425')
      video_embed.should include('http://player.vimeo.com/video/11040425?title=0&amp;byline=0&amp;portrait=0')
    end

    it 'accepts a custom width' do
      video_embed = VideoEmbed.embed('http://vimeo.com/11040425', :width => 720)
      video_embed.should match(/width="720"/) 
    end

    it 'accepts a custom height' do
      video_embed = VideoEmbed.embed('http://vimeo.com/11040425', :height => 480)
      video_embed.should match(/height="480"/) 
    end
  end

  describe 'Fallback' do
    it 'returns an empty string when not a supported service' do
      video_embed = VideoEmbed.embed('http://example.com/')
      video_embed.should eql(%Q{<p>Video embed not available.</p>})
    end
  end
end

