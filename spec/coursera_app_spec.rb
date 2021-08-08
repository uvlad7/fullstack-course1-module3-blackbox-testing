Capybara.default_driver = :selenium
# Capybara.default_driver = :poltergeist

Capybara.app_host = "http://localhost:3000/"

describe "Coursera App" do

  describe "visit root" do
  	before { visit '/' }
    
    it "displays 'Johns Hopkins' (default)" do
      expect(page).to have_content 'Johns Hopkins'
    end

    it "displays table element that has a row with 3 columns" do
      expect(page).to have_selector(:xpath, "//table//tr[count(td)=3]")
    end

    it "column 1 should have the thumbnail inside img tag" do
      expect(page).to have_selector(:xpath, "//table//tr/td[1]//img")
    end
  end

  it "displays 'Weight Management' when looking_for=diet" do
    visit "?looking_for=diet"
    expect(page).to have_content 'Weight Management'  	
  end

end