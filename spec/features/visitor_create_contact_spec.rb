require "spec_helper"

feature "Contact Creation" do
	scenario "allows acces to contacts page" do
		visit '/contacts'
		expect(page).to have_content I18n.t('contacts.contact_us')

	end
	scenario "allows a guest to create message in contacts form" do
		visit '/contacts'
		fill_in :contact_email, :with => 'art@art.ru'
		fill_in :contact_message, :with => 'asdsadsad'
		click_button 'Send message'

		expect(page).to have_content 'Thanks'
	end
end