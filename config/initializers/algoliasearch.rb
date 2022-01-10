AlgoliaSearch.configuration = {
  application_id: ENV['ALGORIA_IP'],
  api_key: ENV['ALGORIA_INDEX_KEY'],
  connect_timeout: 20,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5
}
