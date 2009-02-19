

module GalleryTags
  include Radiant::Taggable

  desc %{
    Create a gallery page part containing YAML
    
    category:
    - image1: description
    - image2: description
    
    *Usage:*
    <r:gallery/>
  }

  tag 'gallery' do |tag|
    unless gallery.nil?
      content=""
      gallery.each do |category, imagepairs|
        imagepairs.each do |imagepair|
          if imagepair.blank?
            content << %Q(<br style="clear:both;"/>)
          else
            imagepair.each do |image, description|
              content << %Q(<a rel="lightbox[#{category}]" href="/images/#{category}/#{image}" title="#{description || " "}"><img src="/images/#{category}/thumbnails/#{image}"/></a>\n)
            end
          end
        end
      end
      content
    else
      raise TagError.new("'gallery' page part must be set up")
    end
  end
  
  def gallery
    return @gallery unless @gallery.nil?
    string = render_part(:gallery)
    @config = string.empty? ? {} : YAML::load(string)
  end
end
