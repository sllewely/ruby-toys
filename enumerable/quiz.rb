require 'csv'

class Question < Struct.new(:question, :answer)
    
end

class Quiz    
    class FileNotFound < StandardError; end
    class BadFileFormat < StandardError; end
    
    def initialize(file_name)
        # TODO: Pass in some kind of io stream instead of opening & reading csv in the quiz
        @questions = []
        File.open(file_name, 'r') do |file|
            while line = file.gets
                parse_csv.call(line)
            end
        end
    end
    
    def each
        return enum_for(:each) unless block_given?
        
        @questions.sort_by { |_| rand }
        @questions.each do |q|
            @current_question = q
            yield q.question
        end
    end
    
    def ask_again
        @current_question.question
    end
    
    def answer
        @current_question.answer
    end
    
    def questions
        @questions
    end
    
            
    private
    
    def parse_csv
        Proc.new do |line|
            CSV.parse(line) do |(question, answer)|
                @questions << Question.new(question, answer)
            end
        end
    end
    
end