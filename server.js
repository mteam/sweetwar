var mallow = require('mallow');
var express = require('express');
var app = express();
var pkg = mallow('./package.json');

app.use(app.router);
app.use(express.static('public'));
app.use(function (err, req, res, next) {
  res.end('console.error(' + JSON.stringify(err.toString()) + ');');
});

app.get('/sweetwar.js', pkg.server);

var port = process.argv[2] || 8080;

app.listen(port);
console.log('running on http://0.0.0.0:' + port);
