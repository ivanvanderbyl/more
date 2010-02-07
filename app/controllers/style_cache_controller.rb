class StyleCacheController < ApplicationController
  caches_page :show, :if => proc { Less::More.page_cache? }

  def show
    path_spec = params[:sheet]
    if Less::More.exists?([path_spec])
      headers['Cache-Control'] = 'public; max-age=2592000' unless Less::More.page_cache? # Cache for a month.
      render :text => Less::More.generate([path_spec]), :content_type => "text/css"
    else
      render :nothing => true, :status => 404
    end
  end
  
end
