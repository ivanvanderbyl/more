ActionController::Routing::Routes.draw do |map|
  match '/stylesheets/*sheet.css' => 'style_cache#show'
end