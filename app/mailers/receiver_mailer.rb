class ReceiverMailer < ApplicationMailer

  def send_event_mail
    itinerary = Itinerary.find(params[:id])
    receiver = itinerary.receiver
    itinerary.events.map do |event|
      path = event_url(event)
      mail = Mail.new do
        from     'do_not_reply@xperienc.com'
        to       'zepher2211@gmail.com'
        subject  'Upcoming Event!'
        body     "Hi #{receiver.to_s}, you've been scheduled to go to #{event.name}. Following is the link to the event details: #{path}"
      end

      mail.delivery_method :sendmail

      mail.deliver
    end
  end
end
