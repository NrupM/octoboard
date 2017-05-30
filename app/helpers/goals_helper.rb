module GoalsHelper

  def readable_today_date
    DateTime.now.strftime('%A, %B %d, %Y.')
  end

  def compare_dates(date)
    current_time = Time.now
    current_time < date
  end


  def greet
    current_time = Time.now.to_i
    midnight = Time.now.beginning_of_day.to_i
    noon = Time.now.middle_of_day.to_i
    five_pm = Time.now.change(:hour => 17 ).to_i
    eight_pm = Time.now.change(:hour => 20 ).to_i

    if midnight.upto(noon).include?(current_time)
      "GOOD MORNING"
    elsif noon.upto(five_pm).include?(current_time)
      "GOOD AFTERNOON"
    elsif five_pm.upto(midnight + 1.day).include?(current_time)
      "GOOD EVENING"
    end
  end

  def grammarize str
    first_letter = str[0].downcase
    second_half = str.split(//).last(str.length-1).join
    return first_letter + second_half
  end

end
