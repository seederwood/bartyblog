ready = ->
    $('.ckeditor').each ->
    CKEDITOR.replace $(this).attr('.ckeditor')

$(document).ready(ready)
$(document).on('page:load', ready)