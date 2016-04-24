gists = require('public-gists')
request = require('request')

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
      return
    i++
  console.log result
  return
