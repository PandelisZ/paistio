var fileLocation = '/Users/pz/tmp/snippets.json';
module.exports = {
  save: function(output){
    console.log(output['0'].id);
    fs.writeFile(fileLocation, output['0'].item, function(err) {
      if(err) {
          return console.log(err);
      }
      console.log('success');
    });
  },

  objSave: function(object){
    var str = JSON.stringify(object);
    fs.writeFile("/Users/pz/tmp/snippets.json", str, function(err) {
      if(err) {
          return console.log(err);
      }
      console.log('success');
    });
  },

  objRead: function(callback){
    fs.readFile(fileLocation, 'utf8', function (err,data) {
      if (err) {
        return console.log(err);
      }
      var object = JSON.parse(data);
      callback(object);
      console.log('file read!');
    });
  }
};
