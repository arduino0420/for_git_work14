const { environment } = require('@rails/webpacker')

// Webpack 4 defaults to MD4, which is disabled by the OpenSSL version used by
// Node.js 24. Use a supported digest and omit Webpacker's MD4-only compression
// plugins. HTTP servers can still compress these assets when serving them.
environment.config.merge({ output: { hashFunction: 'sha256' } })

if (process.env.NODE_ENV === 'production') {
  environment.plugins.delete('Compression')
  environment.plugins.delete('Compression Brotli')
}

module.exports = environment
