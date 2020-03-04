# coding: utf-8
module EventsHelper
  def register_to_googlecalendar(event)    
    link_to "Google Calendar に登録", "http://www.google.com/calendar/event?action=TEMPLATE&text=#{@event.summary}&dates=#{@event.dtstart.strftime('%Y%m%dT%H%M%SZ')}/#{@event.dtend.strftime('%Y%m%dT%H%M%SZ')}&details=#{@event.description}", target: :_blank
  end
end
