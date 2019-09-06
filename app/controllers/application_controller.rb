class ApplicationController < ActionController::API

  protected  
  
  def meta_attributes(resource, extra_meta = {})    
    {
      current_page: resource.current_page,
      next_page: resource.next_page,
      prev_page: resource.previous_page,
      total_pages: resource.total_pages,
      total_count: resource.total_entries
    }.merge(extra_meta)
  end
end
