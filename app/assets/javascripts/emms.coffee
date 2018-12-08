$(document).ready ->
  $('#upload_file').fileinput
    showPreview: false
    showUpload: false
    maxFileCount: 1
    browseClass: 'btn btn-primary fileinput-browse-button'
    browseIcon: ''
    browseLabel: ' ファイル選択'
    removeClass: 'btn btn-warning'
    removeIcon: ''
    removeLabel: ' キャンセル'
    allowedFileExtensions: [ 'emm' ]
    msgInvalidFileExtension: '拡張子が「emm」のファイルのみ有効です。'
    msgValidationError: '<span class = "text-danger"> Emmファイルのみ有効です。 </span>'
  return
