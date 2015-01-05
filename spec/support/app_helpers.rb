require 'slimmer/test_helpers/shared_templates'

module AppHelpers
  include Slimmer::TestHelpers::SharedTemplates

  def expect_title_tag_to_be(text)
    expect(page).to have_selector("title", text: text, visible: false)
  end

  def expect_h1_to_be(text)
    within(shared_component_selector('title')) do
      expect(page).to have_content(text)
    end
  end

  def expect_not_found_error
    expect(page.status_code).to be(404)
  end

  def stub_court(court_slug="total-perspective-vortex", title="Total Perspective Vortex")
    path = "/courts/#{court_slug}"
    court_json = {
      base_path: path,
      title: title,
      description: nil,
      format: "court",
      need_ids: [],
      locale: "en",
      updated_at: "2014-12-17T17:00:18.329Z",
      public_updated_at: nil,
      details: {},
      links: {
        available_translations: [
          {
            title: "Tennis Court",
            base_path: path,
            api_url: "http://content-store.dev.gov.uk/content#{path}",
            web_url: "http://www.dev.gov.uk#{path}",
            locale: "en"
          }
        ]
      }
    }

    content_store_has_item(path, court_json)
  end

  def stub_court_doesnt_exist(court_slug)
    content_store_does_not_have_item("/courts/#{court_slug}")
  end
end
RSpec.configuration.include AppHelpers, type: :feature
