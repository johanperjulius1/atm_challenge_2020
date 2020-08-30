require 'date'

class Account
  attr_accessor :account_status, :exp_date, :pin_code, :balance, :owner

  STANDARD_VALIDITY_YEARS = 5

  def initialize(attrs = {})
    @account_status = :active
    @pin_code = rand(1000..9999)
    @exp_date = Date.today.next_year(Account::STANDARD_VALIDITY_YEARS).strftime('%m/%y')
    @balance = 0
    @owner = set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

  def length_check(pin_code)
    number_length = Math.log10(pin_code).to_i + 1
  end

    #private

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise 'An Account owner is required'
  end

end
