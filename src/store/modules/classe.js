//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    classes: [],
    classe: {
        id: null,
        cod: null,
        description: null,
        classe_category_id: null,
        classe_category: null,
    },
};

const getters = {
    classes: (state) => state.classes,
    classe: (state) => state.classe,
};

const actions = {
    async getClasses({ commit }) {
        let res = await axios.get('classe');
        commit('getClasses', res.data);
    },
    async addClasse({ commit }, classe) {
        let data = new FormData();
        data.append('name', classe.name);
        data.append('surname', classe.surname);
        data.append('school_id', classe.school_id);

        const rsp = await axios.post('classe/store', data);
        commit('addClasse', rsp.data);
    },
    async removeClasse({ commit }, classe) {
        const rsp = await axios.delete('classe/' + classe.id);
        rsp.data;
        commit('removeClasse', classe.id);
    },
    async getClasse({ commit }, classe) {
        const rsp = await axios.post('classe/' + classe.id);
        commit('getClasse', rsp.data);
    },
};

const mutations = {
    getClasses(state, payload) {
        state.classes = payload.sort((a, b) => a.cod.localeCompare(b.cod));
    },
    addClasse(state, payload) {
        state.classes.push(payload.data);
    },
    removeClasse(state, payload) {
        state.classes = state.classes.filter((classe) => classe.id != payload);
    },
    getClasse(state, payload) {
        state.classe = payload;
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};