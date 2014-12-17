module AppHelpers
  def expect_title_tag_to_be(text)
    expect(page).to have_selector("title", text: text, visible: false)
  end

  def expect_h1_to_be(text)
    within('h1') do
      expect(page).to have_content(text)
    end
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
end
RSpec.configuration.include AppHelpers, type: :feature
