require './lib/account.rb'

describe Account do
    it 'is expected to have :active status on initilization' do
        expect(subject.account_status).to eq :active
        
    end
end