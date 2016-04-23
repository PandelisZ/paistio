var gists = require('public-gists');
var request = require('request');

user = 'devStepsize';

    var output = [];
    gists.getPublicGistsByUsername( user, function ( error, result ) {

      if ( error ) {
    		throw new Error( 'There was an error', error );
    	}
    	for(i = 0; i < result.length; i++){
        var filename;
        var file = result[i].files;
        for (var key in file){
          filename = key;
        }

        var raw_url = file[filename].raw_url;

        request(raw_url, function (error, response, body) {
          if (!error && response.statusCode == 200) {
            console.log(body); // Show the HTML for the Google homepage.
          }
        });
      }
    } );
