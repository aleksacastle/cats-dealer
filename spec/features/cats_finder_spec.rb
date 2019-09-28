require 'rails_helper'

describe 'Cats finder', type: :feature do
  before { visit '/' }

  describe 'Request form' do
    it 'has type field' do
      expect(page).to have_content 'Select cat type:'
    end

    it 'has select type field' do
      within('select#cats_type') do
        %w(Bengal Abyssin Persian).each do |option|
          expect(find("option[value=#{option}]").text).to eq(option.capitalize)
        end
      end
    end

    it 'has location field' do
      expect(page).to have_content 'Select your location:'
    end

    it 'has select location field' do
      within('select#user_location') do
        %w(Lviv Kiev Odessa).each do |option|
          expect(find("option[value=#{option}]").text).to eq(option.capitalize)
        end
      end
    end

    it 'has request button' do
      expect(page).to have_selector(:link_or_button, 'Send request')
    end

    it 'redirects to show' do
      click_button 'Send request'
      expect(current_path).to eql(cat_path)
    end
  end

  describe 'Show result page' do
    context 'when no matched result' do
      before { click_button 'Send request' }

      it 'returns meaningful message' do
        expect(page).to have_content 'Sorry, no cats for your location'
      end
    end

    context 'when has matched result' do
      before do
        find('#cats_type').find(:xpath, 'option[2]').select_option
        click_button 'Send request'
      end

      it 'has best price for given location' do
        expect(page).to have_content 'Best price for your location:'
        expect(page).to have_content 500
      end

      it 'has cat table' do
        expect(page).to have_css 'table'
      end

      it 'has cat table with expected columns' do
        within 'table' do
          expect(page).to have_text 'Type Price Location Image'
        end
      end

      it 'has cat table with matched cats' do
        within 'table' do
          expect(page).to have_text 'Abyssin 500 Lviv'
        end
      end
    end
  end
end
