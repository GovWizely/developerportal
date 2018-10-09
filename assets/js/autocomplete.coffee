---
---

extractData = (data) ->
  data.results.map((result) ->
    result.label
  )

remoteSource = (request, response) ->
  url = '{{ site.webservices_baseurl }}/ita_taxonomies/search'
  data = {
    api_key: '{{ site.apikey }}',
    size: 100,
    q: request.term
  }

  $.ajax
    contentType: 'text/plain',
    type: 'GET',
    url: url,
    data: data,
    xhrFields: {
      withCredentials: false
    },
    success: (data) ->
      response extractData(data)
    error: () ->
      response []

selectEvent = (event, ui) ->
  window.location.assign('#search/' + encodeURIComponent(ui.item.value))

jQuery ->
  $('#query').autocomplete
    source: remoteSource
    minLength: 2

loadTaxonomyAutocomplete = ->
  jQuery ->
    $('#query').autocomplete
      source: remoteSource
      select: selectEvent
      minLength: 2

window.loadTaxonomyAutocomplete = loadTaxonomyAutocomplete
