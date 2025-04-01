const cors_proxy = require('cors-anywhere');

const host = '0.0.0.0';
const port = process.env.PORT || 8080;

const originWhitelist = ['https://www.meetles.fr', 'http://localhost:3000'];

const API_KEY = process.env.API_KEY || "secret-token";

cors_proxy.createServer({
  originWhitelist,
  requireHeader: ['origin', 'x-requested-with'],
  checkRateLimit: function (req, cb) {
    if (req.headers['x-api-key'] === API_KEY) {
      cb(null, true);
    } else {
      cb(new Error('Unauthorized - Clé API incorrecte'));
    }
  },
  removeHeaders: ['cookie', 'cookie2'],
  setHeaders: {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Requested-With, X-API-Key'
  }
}).listen(port, host, () => {
  console.log(`✅ Proxy CORS sécurisé en ligne : http://${host}:${port}`);
});
