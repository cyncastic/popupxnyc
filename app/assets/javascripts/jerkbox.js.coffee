# Set the jerkboxes
$ ->
  $('a.jerkbox').slimbox
    overlayOpacity: 0.9,
    captionAnimationDuration: 250,
    counterText: null,
    closeKeys: [27, 70],
    nextKeys: [39, 83]
  , (el)->
      if $(el).attr('data-sold') == 'true'
        myTitle = "<span class='sold'>" + $(el).data('title') + "</span>"
      else
        myTitle = $(el).data('title')
      [el.href, myTitle + '<br />' + 
                $(el).data('medium') + '<br />' + 
                $(el).data('year') + 
                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + 
                $(el).data('width') + 'x' + $(el).data('length')]