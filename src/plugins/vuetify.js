import Vue from 'vue';
import Vuetify from 'vuetify/lib/framework';

Vue.use(Vuetify);

export default new Vuetify({
    theme: {
        themes: {
            light: {
                primary: '#37474f', // #E53935
                secondary: '#0e1d34', // #E53935
            },
        },
    },
});
