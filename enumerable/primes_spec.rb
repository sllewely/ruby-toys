require './primes.rb'

RSpec.describe 'PrimeNumbers' do
    
    let(:subject) { PrimeNumbers.new }
    
    context '.each' do
        let(:each_prime) { subject.each }
        
        it 'returns an enumerator' do
            expect(each_prime).to be_an(Enumerator)
        end
        
        it 'returns the first prime' do
            expect(each_prime.next).to eq(2)
        end
        
        it 'returns prime numbers' do
            expect(each_prime.take(4)).to eq([2, 3, 5, 7])
        end
    end
    
end
        