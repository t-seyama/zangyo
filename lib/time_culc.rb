class TimeCulc
  def zangyo(add_min = 0)
    # 現在の時刻
    current = Time.now.localtime("+09:00") + (add_min * 60)
    current_day = current.day.to_i
    current_hour = current.hour.to_i
    current_min = current.min.to_i

    # 時刻を15分間隔に丸める
    current_min = 15 * (current_min / 15)

    # 残業時間(休憩時間を除く)
    current = Time.new(current.year, current.month ,current_day, current_hour, current_min)
    regular = Time.new(current.year, current.month, current_day, 17, 30)
    regular = regular - (60*60*24)   if (current - regular) < 0 # 0時を超えた時は定時を１日マイナスする
    zangyo_hour = (current - regular).to_i / (60*60)
    zangyo_min = ((current - regular).to_i / 60) - (zangyo_hour * 60)

    # 休憩時間
    rest_min = (zangyo_hour / 2) * 15
    rest_hour = rest_min / 60
    rest_min = rest_min - (rest_hour * 60)

    # 残業時間(休憩時間を含む)
    if zangyo_min < rest_min
      zangyo_hour = zangyo_hour - rest_hour - 1
      zangyo_min = zangyo_min + 60 - rest_min
    else
      zangyo_hour = zangyo_hour - rest_hour
      zangyo_min = zangyo_min - rest_min
    end

    p sprintf("%d:%02d %d:%02d %d:%02d", current_hour, current_min, rest_hour, rest_min, zangyo_hour, zangyo_min)
  end
end
