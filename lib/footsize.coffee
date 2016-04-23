searchView = require './search-view.coffee'
{CompositeDisposable} = require 'atom'

module.exports = footsize =
  searchView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @searchView = new searchView(state.searchViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @searchView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'footsize:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @searchView.destroy()

  serialize: ->
    searchViewState: @searchView.serialize()

  toggle: ->
    console.log 'Wordcount was toggled!'

    if @modalPanel.isVisible()

      @modalPanel.hide()
    else
      @modalPanel.show()
