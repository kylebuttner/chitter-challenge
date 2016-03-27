feature 'sign up' do
  scenario 'user should enter email and password with confirmation' do
    sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'mikey')
    expect(page).to have_content 'Welcome, Mike!'
  end

  scenario 'user must use unique email address' do
    sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'mikey')
    expect { sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'mikey') }.not_to change(User, :count)
    # expect(page).to have_content 'That email is already in use'
  end

  scenario 'sign up should increase user count by 1' do
    expect { sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'mikey') }.to change(User, :count).by(1)
  end

  # scenario 'sign up should initiate session' do
  #   expect { sign_up('Mike', 'mike@gmail.com', 'goodfriday',
  #           'goodfriday', 'mikey') }
  # end

  #make sure required fields are required
end
