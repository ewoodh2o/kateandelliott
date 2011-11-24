class Response < ActiveRecord::Base

  validates :name, :presence => true
  validates :guests, :numericality => true, :inclusion => 0..6

  def attending?
    guests > 0
  end

  def attending
    attending? ? 'yes' : 'no'
  end
  
  def attending=(val)
    guests = 0 if val == 'no'
  end

end
