module.exports = {
    pluginOptions: {
        i18n: {
            locale: process.env.APP_LOCALE || 'pt',
            fallbackLocale: process.env.APP_FALLBACKLOCALE || 'pt',
            localeDir: 'locales',
            enableInSFC: false,
        },
    },

    transpileDependencies: ['vuetify'],
    devServer: {
        port: process.env.PORT,
        proxy: `http://localhost:${process.env.SERVER_PORT}`,
    },
};