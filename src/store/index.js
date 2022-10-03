import Vue from 'vue';
import Vuex from 'vuex';

import settings from './modules/setting';
import user from './modules/user';

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        settings,
        user,
    },
});