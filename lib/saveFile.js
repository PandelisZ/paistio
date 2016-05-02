module.exports = {
  save: function(output){
    console.log(output['0'].id);
    fs.writeFile("/Users/pz/tmp/snippets.json", output['0'].item, function(err) {
      if(err) {
          return console.log(err);
      }
      console.log('success');
    });
  }
};
