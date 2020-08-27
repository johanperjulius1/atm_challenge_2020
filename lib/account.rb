require 'date'

class Account
    attr_accessor :account_status
    
    def initialize
        @account_status = :active
    end

end