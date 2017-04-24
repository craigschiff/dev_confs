
RSpec.describe Event do
  it 'creates a new event on create' do
    Event.create(name: 'hello', description: 'best conf')
    expect(Event.all.count).to eq(1)
    expect(Event.first.name).to eq('hello')
  end
end
