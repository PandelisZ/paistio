var gists = require('public-gists');

module.exports = {

  getPublicGistsByUsername: function(user){
    gists.getPublicGistsByUsername( user, function ( error, result ) {
      if ( error ) {
        throw new Error( 'There was an error', error );
      }
      console.log( 'getPublicGistsByUsername: ', result[0] );
    } );
  }

}
