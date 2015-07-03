require './quiz'

RSpec.describe Quiz do

    context 'errors' do
        it 'returns an error if file cannot be opened' do
            expect { Quiz.new('file_not_found.csv') }.to raise_error(FileNotFound)
        end

        it 'returns an error if file is in unexpected format' do
            expect { Quiz.new('file_not_found.csv') }.to raise_error(BadFileFormat)
        end
    end
    
    context 'with okay file' do
        let(:subject) { Quiz.new('../quizes/modules.csv') }
        
        it 'asks a question' do
            
        end
    end
    
end