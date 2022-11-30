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
    empycalendar: {
        id: null,
        start_date: null,
        end_date: null,
        description: null
    },
};

const getters = {
    calendars: (state) => state.calendars,
    calendar: (state) => state.calendar,
    empycalendar: (state) => state.empycalendar,
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
    async editCalendar({ commit }, calendar) {
        calendar.description='Formação de Professores '+(new Date().getFullYear());
        const rsp = await axios.put('ifpcalendar/' + calendar.id, calendar);
        commit('editCalendar', rsp.data.data);
    },
    setCalendar({ commit }, calendar){
        commit('setCalendar',calendar)
    },
    empyCalendar({commit}){
        console.log('Empy');
        commit('empyCalendar');
    }
};

const mutations = {
    getCalendars(state, payload) {
        state.calendars = payload;
    },
    setCalendar(state, payload) {
        state.calendar = payload;
    },
    empyCalendar(state){
        state.calendar={id: null,
            start_date: null,
            end_date: null,
            description: null};
    },
    addCalendar(state, payload) {
        state.calendars.push(payload.data);
    },
    removeCalendar(state, payload) {
        state.calendars = state.calendars.filter((calendar) => calendar.id != payload);
    },
    getCalendar(state, payload) {
        state.calendar = payload;
    },
    editCalendar(state, payload) {
        let calendar = state.calendars.findIndex((calendar) => calendar.id == payload.id)
        state.calendars.splice(calendar, 1, payload);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};