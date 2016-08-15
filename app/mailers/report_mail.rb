class ReportMailer < ApplicationMailer

    def day_test
      mail(:to=> "jamst.li@whmall.com;107422244@qq.com" ,:subject => "测试邮件")
    end

end