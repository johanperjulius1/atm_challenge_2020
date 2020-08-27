require 'date'

class Account
    attr_accessor   :account_status
    attr_accessor   :pin_code
    
    def initialize
        @account_status = :active
        @pin_code = rand(1000..9999)
    end

    def deactivate
        @account_status = :deactivated
    end

    def length_check(pin_code)
        number_length = Math.log10(pin_code).to_i + 1
    end
end