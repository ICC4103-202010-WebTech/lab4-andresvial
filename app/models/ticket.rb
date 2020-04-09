class Ticket < ApplicationRecord
  belongs_to :order
  belongs_to :ticket_type

  before_create :increase_stats
  after_destroy :decrease_stats

  private
  def increase_stats
    es = self.ticket_type.event.event_stat
    ven = self.ticket_type.event.event_venue
    if es.tickets_sold >= ven.capacity
      raise Exceptions::CriticalError.new("something went wrong!")
      return
    end
    es.tickets_sold = es.tickets_sold + 1
    es.attendance = es.attendance + 1
    es.save
  end

  private
  def decrease_stats
    es = self.ticket_type.event.event_stat
    es.tickets_sold = es.tickets_sold - 1
    es.attendance = es.attendance - 1
    es.save
  end
end
