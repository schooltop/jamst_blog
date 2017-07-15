module ApplicationHelper
  def show_db_time(time)
    if time.present?
      time.localtime.to_s(:db)
    end
  end	

  def qq_link(qq)
    return "" if qq.blank?
    link_to "tencent://message/?Menu=yes&uin=#{qq}", data: {content: "QQ: #{qq}"}, class: 'popups' do
      "QQ:107422244".html_safe
    end
  end
end
