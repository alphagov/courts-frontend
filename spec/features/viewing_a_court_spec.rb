require 'rails_helper'
require 'gds_api/test_helpers/content_store'

feature 'Viewing a court' do
  include GdsApi::TestHelpers::ContentStore

  scenario 'Viewing a court' do
    stub_court('total-perspective-vortex')

    visit '/courts/total-perspective-vortex'

    expect_h1_to_be 'Total Perspective Vortex'
    expect_title_tag_to_be 'Total Perspective Vortex – Courts – GOV.UK'
  end

  scenario 'Viewing a nonexistent court' do
    stub_court_doesnt_exist('totally-made-up')

    visit '/courts/totally-made-up'

    expect_not_found_error
  end
end
