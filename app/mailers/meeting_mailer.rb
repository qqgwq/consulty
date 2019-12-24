class MeetingMailer < ApplicationMailer
  helper :application

  default from: "notifications@consultly.com"  


  def meeting_scheduled
    @meeting = params[:meeting]
    @user = params[:user]

    mail(to: @user.email, subject: 'New Seesion Confirmation')
  end
end
