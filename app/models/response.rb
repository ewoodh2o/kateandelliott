class Response < ActiveRecord::Base

  validates :name, :presence => true
  validates :guests, :numericality => true, :inclusion => 0..6, :allow_nil => true
  validates :guests, :presence => true, :if => :attending?

  def attending
    attending? ? 'yes' : 'no'
  end

  def attending=(val)
    if val.is_a?(String)
      self[:attending] = (val == 'yes')
    else
      self[:attending] = val
    end
  end

  def set_guests_to_nil_if_not_attending
    self[:guests] = nil unless attending?
  end
  before_save :set_guests_to_nil_if_not_attending

end
