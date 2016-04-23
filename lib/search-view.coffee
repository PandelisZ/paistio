module.exports =
class searchView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('searchView')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The Wordcount package is Alive! It's ALIVE!"
    message.classList.add('message')
    inputitem = document.createElement('input')
    inputitem.type="text"

    @element.appendChild(message)
    @element.appendChild(inputitem)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
