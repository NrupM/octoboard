module JobApplicationsHelper

  def grammarize_result_num(count)
    if count == 0
      return 'no results'
    elsif count == 1
      return '1 result'
    else
      return count.to_s+' results'
    end
  end

end
