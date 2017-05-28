$ ->
  ARCHIVE_URL = '/arquivar-premio'
  CHOOSE_URL = '/escolher-premio'

  postJSON = (url, data) ->
    $.ajax
      url: url
      data: data
      type: 'POST'
      dataType: 'json'
    .success (data)->
      location.reload()
    .fail (response, status)->
      alert('Não pode')

  $('.js-choose').click (e) ->
    e.preventDefault()
    elt = $(this)
    id = elt.data('id')
    postJSON(CHOOSE_URL, { id: id })
    elt.removeClass('green').addClass('gray')
