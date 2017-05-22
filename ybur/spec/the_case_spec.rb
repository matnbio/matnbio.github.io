RSpec.describe 'an ideal epidemiologic case' do
  it 'is returns epi week' do
    case = Case.new(date)
    expect(Case.date).to eq(date)
  end
end
