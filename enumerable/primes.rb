class PrimeNumbers
    
    def each
        return enum_for(:each) unless block_given?
        
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