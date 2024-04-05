const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

// Define o ambiente de desenvolvimento
process.env.NODE_ENV = process.env.NODE_ENV || 'development';

// Carrega a configuração de ambiente do webpack e mescla com configurações específicas de desenvolvimento, se necessário
module.exports = {
    ...environment.toWebpackConfig(),

    // Configuração específica de desenvolvimento aqui

    // Configuração do ambiente Node.js
    node: {
        __dirname: false,   // Desativa o uso de __dirname
        __filename: false,  // Desativa o uso de __filename
    }
}

// Adicione o plugin Provide para jQuery, se necessário
if (process.env.NODE_ENV === 'development') {
    module.exports.plugins.push(
        new webpack.ProvidePlugin({
            $: 'jquery',
            jQuery: 'jquery'
        })
    );
}
