class Request < ApplicationRecord

  after_initialize :set_status_default

  def set_status_default
    self.status ||= false
  end

end
