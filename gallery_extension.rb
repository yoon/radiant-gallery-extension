# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class GalleryExtension < Radiant::Extension
  version "0.1"
  description "Gallery from YAML file"
  url ""
  
  # define_routes do |map|
  #   map.connect 'admin/gallery/:action', :controller => 'admin/gallery'
  # end
  
  def activate
    # admin.tabs.add "Gallery", "/admin/gallery", :after => "Layouts", :visibility => [:all]
    Page.send :include, GalleryTags
  end
  
  def deactivate
    # admin.tabs.remove "Gallery"
  end
  
end