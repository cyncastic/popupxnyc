# Set the jerkboxes
$ ->
  $('a.jerkbox').slimbox
    overlayOpacity: 0.9,
    captionAnimationDuration: 250,
    counterText: null,
    closeKeys: [27, 70],
    nextKeys: [39, 83]
  , (el)->
      if $(el).attr('data-sold') is 'true'
        myTitle = "<span class='sold'>" + $(el).data('title') + "</span>"
      else
        myTitle = $(el).data('title')
      if $(el).attr('data-price') isnt 'null'
        myPrice = "<div class='price'>" + "$" + $(el).data('price') + "</div>"
      else
        myPrice = ""
      [el.href, myTitle + '<br />' + 
                $(el).data('artist') + '<br />' +
                myPrice  +
                $(el).data('medium') + '<br />' + 
                $(el).data('year') + 
                '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + 
                $(el).data('length') + 'x' + $(el).data('width')]