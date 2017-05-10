module ApplicationHelper

  def check_for_http url
    if url[0..7] == 'https://' || url[0..6] == 'http://'
      return url
    elsif url[0..3] == 'www.'
      return 'https://'+url
    else
      return 'https://'+url
    end
  end


end
