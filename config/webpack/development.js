const { merge } = require('webpack-merge');
const environment = require('./environment');

// Define o ambiente de desenvolvimento
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

// Carrega a configuração de ambiente do webpack e mescla com configurações específicas de desenvolvimento, se necessário
module.exports = merge(environment.toWebpackConfig(), {
    // Configurações específicas de desenvolvimento aqui

    // Configuração do ambiente Node.js
    node: {
        __dirname: false,   // Desativa o uso de __dirname
        __filename: false,  // Desativa o uso de __filename
    }
});
