module UsersHelper
  def judge_sex(user_sex)
    if user_sex.male?
      "男性"
    else
      "女性"
    end
  end

  def judge_status(user_status)
    if user_status.alone?
      "独身"
    elsif user_status.married?
      "既婚"
    else
      "離婚"
    end
  end
end
