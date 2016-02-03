$(document).on 'ready page:load', ->
  trs = document.querySelectorAll('tr')
  dragSrcEl = null

  handleDragStart = (e) ->
    dragSrcEl = this
    e.dataTransfer.effectAllowed = 'move'
    e.dataTransfer.setData 'text/html', @innerHTML
    return


  handleDragOver = (e) ->
    if e.preventDefault
      e.preventDefault()
    e.dataTransfer.dropEffect = 'move'
    false

  handleDragEnter = (e) ->
    @classList.add 'over'
    return

  handleDragLeave = (e) ->
    @classList.remove 'over'
    return

  handleDrop = (e) ->
    if e.stopPropagation
      e.stopPropagation()
    false

    if dragSrcEl != this
      dragSrcEl.innerHTML = @innerHTML
      @innerHTML = e.dataTransfer.getData('text/html')



  handleDragEnd = (e) ->
    [].forEach.call trs, (tr) ->
      tr.classList.remove 'over'
      return
    return


  [].forEach.call trs, (tr) ->
    tr.addEventListener 'dragstart', handleDragStart, false
    tr.addEventListener 'dragenter', handleDragEnter, false
    tr.addEventListener 'dragover', handleDragOver, false
    tr.addEventListener 'dragleave', handleDragLeave, false
    tr.addEventListener 'drop', handleDrop, false
    tr.addEventListener 'dragend', handleDragEnd, false
    return

# tutorial found at http:www.html5rocks.com/en/tutorials/dnd/basics/
