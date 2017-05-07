module GoalsHelper

  def readable_today_date
    DateTime.now.strftime('%A, %B %d, %Y.')
  end

  def compare_dates(date)
    current_time = Time.now
    current_time < date
  end

  def greet
    now = Time.now
    today = Date.today.to_time

    morning = today.beginning_of_day
    noon = today.noon
    evening = today.change( hour: 17 )
    night = today.change( hour: 20 )
    tomorrow = today.tomorrow

    if (morning..noon).cover? now
      'GOOD MORNING'
    elsif (noon..evening).cover? now
      'GOOD AFTERNOON'
    else (evening..tomorrow).cover? now
      'GOOD EVENING'
    end
  end

end
