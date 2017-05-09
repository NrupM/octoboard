module ApplicationHelper

  def check_for_http url
    if url[0...6] != 'http://' && url[0..6] != 'https://'
      return 'http://' + url
    end
  end


end
