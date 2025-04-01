const cors_proxy = require('cors-anywhere');

const host = '0.0.0.0';
const port = process.env.PORT || 8080;

// Whitelist des domaines autorisés à utiliser le proxy
const originWhitelist = [
  'https://www.meetles.fr',
  'http://localhost:3000'
];

// (Optionnel) clé d'API simple pour renforcer la sécurité
const API_KEY = process.env.API_KEY || "secret-token";

cors_proxy.createServer({
  originWhitelist,
  checkRateLimit: function(req, cb) {
    if (req.headers['x-api-key'] === API_KEY) {
      cb(null, true);
    } else {
      cb(new Error('Unauthorized'));
    }
  },
  requireHeader: ['origin', 'x-requested-with'],
  removeHeaders: ['cookie', 'cookie2']
}).listen(port, host, () => {
  console.log(`CORS proxy running on http://${host}:${port}`);
});
