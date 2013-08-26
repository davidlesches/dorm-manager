module ApplicationHelper

  def title name = nil
    if name.present?
      content_for(:title, name)
    else
      content_for?(:title) ? content_for(:title) + ' | ' + CONFIG[:site_name] : CONFIG[:site_name]
    end
  end

end
