import Vue from 'vue';
import Vuex from 'vuex';

import settings from './modules/setting';
import user from './modules/user';
import product from './modules/product';
import dialog from './modules/dialog';

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        settings,
        user,
        product,
        dialog,
    },
});