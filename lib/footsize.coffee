searchView = require './search-view.coffee'
#snippetNaming = require './snippet-naming.coffee'
gists = require './gist'
{CompositeDisposable} = require 'atom'

module.exports = footsize =
  searchView: null
  #snippetNaming: null
  modalPanel: null
  subscriptions: null
  resultsList: null

  activate: (state) ->
    @editor = atom.workspace.getActiveTextEditor()
    @output = []

    @searchView = new searchView
    #@snippetNaming = new snippetNaming
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'footsize:toggle': => @toggle(),
      'footsize:selectText': => @selectText()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @searchView.destroy()

  serialize: ->
    searchViewState: @searchView.serialize()

  toggle: ->
    @searchView.menu(@output)

  selectText: ->
    console.log(@editor.getSelectedText())
    @output.push {'name': 'test', 'code': @editor.getSelectedText()}
    console.log(@output)
