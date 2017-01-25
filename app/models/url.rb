class Url < ActiveRecord::Base
#p validates_format_of :long_url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  
  before_create :url_short
  belongs_to :user

  private
  def url_short
    url_final = ""
    spliteado = self.long_url.split('/',5)
    spliteado.each do |i|
      if i == spliteado[-1]
        url_final += "#{Time.now.to_s.delete(" -0600")}"        
      end
    end
    self.short_url = url_final
  end
end