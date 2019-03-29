class EmailSenderJob < ApplicationJob
  queue_as :default

  def perform(params)
    mail = Mail.new do
      from     'do_not_reply@xperienc.com'
      to       "#{params.email}"
      subject  'Upcoming Event!'
      body     "Congratulations! #{@current_user.to_s} has paid all expenses for a trip to #{itinerary.destination}. Following is the link containing all of the information in regards to your trip: #{path}. Over the period of your trip you will receive emails in regard to the events that have been scheduled for you. Stay tuned!"
    end

    mail.delivery_method :sendmail

    mail.deliver
  end
end
