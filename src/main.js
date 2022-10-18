import Vue from 'vue';
import VueFuse from 'vue-fuse';
import VModal from 'vue-js-modal';
import ToggleButton from 'vue-js-toggle-button';

import App from './App.vue';
import router from './router/router';
import i18n from './i18n';
import store from './store';
import vuetify from './plugins/vuetify';
import dotenv from 'dotenv';
import VueAxios from 'vue-axios';
import axios from './plugins/axios';

import moment from 'moment';
import 'moment/locale/pt';
//import './plugins/vee-validate';

dotenv.config();

Vue.config.productionTip = false;
Vue.prototype.$api = axios;
Vue.use(ToggleButton);
Vue.use(VueFuse);
Vue.use(VModal);
Vue.use(VueAxios, axios);

// use beforeEach route guard to set the language
router.beforeEach((to, from, next) => {
    // use the language from the routing param or default language
    let language = to.params.lang;
    if (!language) {
        language = 'pt';
    }

    // set the current language for i18n.
    i18n.locale = language;
    next();
});

Vue.filter('upper', function(value) {
    if (!value) return '';
    value = value.toString();
    return value.toUpperCase();
});

Vue.filter('date', function(value) {
    if (!value) return '';
    return moment(value).locale(i18n.locale).format('LLLL').slice(0, -5);
});

Vue.filter('date_short', function(value) {
    if (!value) return '';
    return moment(value).locale(i18n.locale).format('LL');
});

Vue.filter('date_with_week', function(value) {
    if (!value) return '';
    return moment(value).locale(i18n.locale).format('LLLL').slice(0, -5);
});

Vue.filter('excerpt', function(value) {
    if (!value) return '';

    if (value.length > 100) {
        value = value.substring(0, 100) + '...';
    }

    return value;
});

Vue.filter('excerpt_shorter', function(value) {
    if (!value) return '';

    if (value.length > 50) {
        value = value.substring(0, 50) + '...';
    }

    return value;
});

new Vue({
    router,
    i18n,
    store,
    vuetify,
    render: (h) => h(App),
}).$mount('#app');