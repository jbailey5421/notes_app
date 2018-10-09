require 'notes'
describe Notes do
    it 'responds to add' do
    expect(subject).to respond_to(:add)
    end
     it 'responds to view' do
    expect(subject).to respond_to(:view)
    end
     it 'responds to choose' do
    expect(subject).to respond_to(:choose)
    end
    
    
    
end