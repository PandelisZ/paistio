searchView = require './search-view.coffee'
gists = require './gist'
{CompositeDisposable} = require 'atom'

module.exports = footsize =
  searchView: null
  modalPanel: null
  subscriptions: null
  resultsList: null

  activate: (state) ->
    gists.getPublicGistsByUsername 'devStepsize', (error, result) ->
      output = []
      if error
        throw new Error('There was an error', error)
      i = 0
      while i < result.length
        filename = undefined
        file = result[i].files
        for key of file
          filename = key
        raw_url = file[filename].raw_url
        request raw_url, (error, response, body) ->
          if !error and response.statusCode == 200
            output.push body
            # Show the HTML for the Google homepage.
          return
        i++
      @resultsList = result
      return
    @searchView = new searchView
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
    @searchView.menu(@resultsList)
