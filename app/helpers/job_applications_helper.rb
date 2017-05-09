module JobApplicationsHelper

  def grammarize_result_num(count)
    if count == 1
      return '1 result'
    else
      return count+' results'
    end
  end

end
