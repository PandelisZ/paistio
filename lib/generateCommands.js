var fs = require('fs');
var request = require('request');
var gists = require('public-gists');

function fixCallbackshitness(callback){
  gists.getPublicGistsByUsername('devStepsize', function(error, result) {
    if (error) {
      throw new Error('There was an error', error);
    }
    callback(result);
    });
}

fixCallbackshitness(function(fuckerry){
  fs.writeFile("gist.json", fuckerry.toString(), function(err) {
    if(err) {
        return console.log(err);
    }

    console.log(fuckerry);
  });
});
