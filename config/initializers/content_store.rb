require 'gds_api/content_store'

CourtsFrontend.content_store = GdsApi::ContentStore.new(Plek.current.find('content-store'))
