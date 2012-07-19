var mallow = require('mallow');
var express = require('express');
var app = express.createServer();
var pkg = mallow('./package.json');

app.use(app.router);
app.use(express.static(__dirname + '/public'));

app.get('/sweetwar.js', pkg.server);
app.get('/*.png', function (req, res, next) {
  var time = Math.random() * 3000 + 1000;
  setTimeout(function () {
    next();
  }, time);
});

var port = process.argv[2] || 8080;

app.listen(port);
console.log('running on http://0.0.0.0:' + port);
