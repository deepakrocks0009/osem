class Venue < ActiveRecord::Base
  has_many :conferences
  before_create :generate_guid

  private

  def generate_guid
    begin
      guid = SecureRandom.urlsafe_base64
    end while Venue.where(:guid => guid).exists?
    self.guid = guid
  end

end
