require("@babel/register");
var connect = require('connect');
var http = require('http');
const querystring = require('querystring');
var app = connect();

/**

action: popup/inline/confirm/alert

*/
app.use(function (req, res) {
  // parse query
  console.log('req: ', req.url)

  res.end(JSON.stringify({
    "aciton": "popup",
    "text": "title for popup"
  }));
});

//create node.js http server and listen on port
http.createServer(app).listen(4000);