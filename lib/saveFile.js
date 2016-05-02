module.exports = {
  save: function(output){
    console.log(output['0']);
    fs.writeFile("./snippets.json", output['0'], function(err) {
      if(err) {
          return console.log(err);
      }
      console.log('success');
    });
  }
};
