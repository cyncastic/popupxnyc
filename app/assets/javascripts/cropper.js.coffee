$ ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 400, 400]
      onSelect: @update
      onChange: @update
  
  update: (coords) =>
    $('#artwork_crop_x').val(coords.x)
    $('#artwork_crop_y').val(coords.y)
    $('#artwork_crop_w').val(coords.w)
    $('#artwork_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(180/coords.w * $('#cropbox').width()) + 'px'
      height: Math.round(180/coords.h * $('#cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(180/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(180/coords.h * coords.y) + 'px'
