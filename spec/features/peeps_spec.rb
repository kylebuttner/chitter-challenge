feature 'peeping' do
  scenario 'homepage should show list of all user peeps' do
    visit '/'
    sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'mikey')
    fill_in :new_peep, with: 'This is my first peep'
    click_button 'Post peep'
    expect(page).to have_content 'This is my first peep'
  end
end
