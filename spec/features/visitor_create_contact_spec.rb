require "spec_helper"

feature "Contact Creation" do
	scenario "allows acces to contacts page" do
		visit '/contacts/new'
		expect(page).to have_content 'Blabla'

	end
end