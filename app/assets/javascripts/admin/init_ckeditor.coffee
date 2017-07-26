ready = ->
    $('.ckeditor').each ->
    CKEDITOR.replace $(this).attr('class')

$(document).ready(ready)
$(document).on('page:load', ready)