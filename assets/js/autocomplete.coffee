---
---

extractData = (data) ->
  data.results.map((result) ->
    result
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
    error: ->
      response []

selectEvent = (event, ui) ->
  window.location.assign("taxonomy.html?##{ui.item.id}")

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
    .data('ui-autocomplete')
    ._renderItem = (ul, item) ->
      $('<li>')
        .data('ui-autocomplete-item', item)
        .append("<a href='taxonomy.html?##{item.id}'>#{item.label}</a>")
        .appendTo(ul)

window.loadTaxonomyAutocomplete = loadTaxonomyAutocomplete
