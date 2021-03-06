feature 'sign up' do
  scenario 'user should enter email and password with confirmation' do
    sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'mikey')
    expect(page).to have_content 'Welcome, Mike!'
  end

  scenario 'password confirmation much match password' do
    expect { sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'wrong', 'mikey') }.not_to change(User, :count)
  end

  scenario 'user must use unique email address' do
    sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'mikey')
    expect { sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'notmikey') }.not_to change(User, :count)
    # expect(page).to have_content 'That email is already in use'
  end

  scenario 'user must use unique username' do
    sign_up('Mike', 'mike@gmail.com', 'goodfriday',
            'goodfriday', 'mikey')
    expect { sign_up('Mike', 'notmike@gmail.com', 'goodfriday',
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

feature 'sign in' do
  let(:user) do
    User.create(username: 'test',
                name: 'test',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'with correct credentials' do
    sign_in('mikey','goodfriday')
    expect(page).to have_content "Welcome, #{user.username}!"
  end

feature 'sign out' do

  before(:each) do
    User.create(username: 'test',
                name: 'test',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in('test', 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
end
