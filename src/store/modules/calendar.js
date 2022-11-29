//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    calendars: [],
    calendar: {
        id: null,
        start_date: null,
        end_date: null,
        description: null
    },
};

const getters = {
    calendars: (state) => state.calendars,
    calendar: (state) => state.calendar,
};

const actions = {
    async getCalendars({ commit }) {
        let res = await axios.get('ifpcalendar');
        console.log(res.data);
        commit('getCalendars', res.data);
    },
    async addCalendar({ commit }, calendar) {
        let data = new FormData();
        data.append('description', "Formação de Professores "+new Date().getFullYear());
        data.append('start_date', calendar.start_date);
        data.append('end_date', calendar.end_date);

        const rsp = await axios.post('ifpcalendar/store', data);
        commit('addCalendar', rsp.data);
    },
    async removeCalendar({ commit }, calendar) {
        const rsp = await axios.delete('ifpcalendar/' + calendar);
        rsp.data;
        commit('removeCalendar', calendar);
    },
    async getCalendar({ commit }, calendar) {
        const rsp = await axios.get('ifpcalendar/' + calendar.id);
        commit('getCalendar', rsp.data);
    },
};

const mutations = {
    getCalendars(state, payload) {
        state.calendars = payload;
    },
    addCalendar(state, payload) {
        state.calendars.push(payload.data);
    },
    removeCalendar(state, payload) {
        state.calendars = state.calendars.filter((calendar) => calendar.id_shedule_exam != payload);
    },
    getCalendar(state, payload) {
        state.calendar = payload;
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};