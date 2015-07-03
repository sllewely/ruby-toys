class PrimeNumbers
    
    def each
        return enum_for(:each) unless block_given?
        @primes_found = []
        (2..Float::INFINITY).each do |n|
            if prime?(n)
                @primes_found << n
                yield n
            end
        end
    end
    
    def primes_found
        @primes_found
    end
        
    private
    
    def prime?(num)
        !primes_found.find { |p| num % p == 0 }
    end
end

class AllPositiveNumbers
   
    def each(start=nil)
        current = start || 0
        return enum_for(:each) unless block_given?
        loop do
            yield current
            current += 1
        end
    end
    
end

all_positive_numbers = Enumerator.new do |n|
    10000.times { |number| n.yield(number) }
end