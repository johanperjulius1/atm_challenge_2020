require './lib/account.rb'

describe Account do
    it 'is expected to have :active status on initilization' do
        expect(subject.account_status).to eq :active
    end

    it 'is expected to have a random pin code generated on initialization' do
        expect(subject.pin_code).to eq number_length
    end

    it 'deactivates account using the instance method' do
        subject.deactivate
        expect(subject.account_status).to eq :deactivated
    end

    it 'to check if pin code is 4 digits' do
        expect(subject.length_check(1234)).to eq 4
    end
end