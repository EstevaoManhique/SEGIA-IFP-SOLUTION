import Vue from 'vue';
import Vuex from 'vuex';

import settings from './modules/setting';
import user from './modules/user';
import dialog from './modules/dialog';
import teacher from './modules/teacher';
import student from './modules/student';
import person from './modules/person';
import calendar from './modules/calendar';
import classe from './modules/classe';

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        settings,
        user,
        dialog,
        teacher,
        student,
        person,
        calendar,
        classe,
    },
});