module PhoneConcern
  extend ActiveSupport::Concern

  def normalize_phone_number
    if self.phone.present?
      phone = self.phone.gsub(/[^0123456789+]/, "")
      if /\A\+33[1-9][0-9]{8}\z/.match(phone)
        self.phone = phone
      elsif /\A0[1-9][0-9]{8}\z/.match(phone)
        phone[0] = ""
        self.phone = "+33" + phone
      elsif /\A[1-9][0-9]{8}\z/.match(phone)
        self.phone = "+33" + phone
      else
        self.phone = nil
      end
    end
  end
end
