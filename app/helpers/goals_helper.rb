module GoalsHelper

  def readable_today_date
    DateTime.now.strftime('%A, %B %d, %Y.')
  end

  def compare_dates(date)
    current_time = Time.now
    current_time < date
  end

end
