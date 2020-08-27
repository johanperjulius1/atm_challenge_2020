require './lib/account.rb'

describe Account do
    it 'is expected to have :active status on initilization' do
        expect(subject.account_status).to eq :active
    end

    it 'deactivates account using the instance method' do
        subject.deactivate
        expect(subject.account_status).to eq :deactivated
    end

    it 'to check if pin code is 4 digits' do
        expect(subject.length_check(1000)).to eq 4
    end

    it 'expected to have an expiry date on initialize' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end
end