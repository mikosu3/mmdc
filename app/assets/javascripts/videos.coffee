$(document).on 'turbolinks:load', ->

  $('#upload_file').fileinput
    language: 'ja'
    hideThumbnailContent: true
    allowedFileExtensions: [
      'emm'
      'xml'
      'mpj'
    ]
    removeFromPreviewOnError: true
    showUpload: false
    fileActionSettings: showZoom: false

  $('#check_all').on 'change', ->
    $('input[name^=ids]').prop 'checked', @checked
    return
  return
