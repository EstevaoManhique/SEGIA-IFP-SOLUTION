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
        const rsp = await axios.post('classe/store', classe);
        commit('addClasse', rsp.data);
    },
    async updateClasse({ commit }, classe) {
        const rsp = await axios.put('classe/' + classe.id, classe);

        commit('updateClasse', rsp.data.data);
    },
    async removeClasse({ commit }, classe) {
        const rsp = await axios.delete('classe/' + classe.id);

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
    updateClasse(state, payload) {
        let classe = state.classes.findIndex((classe) => classe.id == payload.id);
        state.classes.splice(classe, 1, payload);
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