//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    schools: [],
    provinceToFilterCenters: null,
    school: {
        cod: null,
        name: null,
        abbreviation: null,
        district_id: null,
        type: null,
        isCentro: false,
    },
};

const getters = {
    schools: (state) => state.schools,
    centers: (state) => state.centers,
    school: (state) => state.school,
};

const actions = {
    async getSchools({ commit }) {
        let res = await axios.get('school');
        commit('getSchools', res.data);
    },
    async addSchool({ commit }, school) {
        const rsp = await axios.post('school/store', school);
        commit('addSchool', rsp.data);
    },
    async updateSchool({ commit }, school) {
        const rsp = await axios.put('school/' + school.id, school);
        commit('updateSchool', rsp.data.data);
    },
    async removeSchool({ commit }, school) {
        const rsp = await axios.delete('school/' + school.id);
        commit('removeSchool', school.id);
    },
    async getSchool({ commit }, school) {
        const rsp = await axios.post('school/' + school.id);
        commit('getSchool', rsp.data);
    },
    async setSchools({ commit }, schools) {
        commit('setSchools', schools);
    },
};

const mutations = {
    getSchools(state, payload) {
        state.schools = payload;
    },
    addSchool(state, payload) {
        state.schools.push(payload.data);
    },
    updateSchool(state, payload) {
        let school = state.schools.filter((school) => school.id == payload.id)[0];
        state.schools.splice(school, 1, payload);
    },
    removeSchool(state, payload) {
        state.schools = state.schools.filter((school) => school.id != payload);
    },
    getSchool(state, payload) {
        state.school = payload;
    },
    setSchools(state, payload) {
        state.schools = payload;
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};