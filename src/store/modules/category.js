//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    categorys: [],
    category: {
        id: null,
        cod: null,
        description: null,
        category_category_id: null,
        category_category: null,
    },
};

const getters = {
    categorys: (state) => state.categorys,
    category: (state) => state.category,
};

const actions = {
    async getCategorys({ commit }) {
        let res = await axios.get('category');
        commit('getCategorys', res.data);
    },
    async addCategory({ commit }, category) {
        const rsp = await axios.post('category/store', category);
        commit('addCategory', rsp.data);
    },
    async updateCategory({ commit }, category) {
        const rsp = await axios.put('category/' + category.id, category);

        commit('updateCategory', rsp.data.data);
    },
    async removeCategory({ commit }, category) {
        const rsp = await axios.delete('category/' + category.id);

        commit('removeCategory', category.id);
    },
    async getCategory({ commit }, category) {
        const rsp = await axios.post('category/' + category.id);
        commit('getCategory', rsp.data);
    },
};

const mutations = {
    getCategorys(state, payload) {
        state.categorys = payload.sort((a, b) => a.cod.localeCompare(b.cod));
    },
    addCategory(state, payload) {
        state.categorys.push(payload.data);
    },
    updateCategory(state, payload) {
        let category = state.categorys.findIndex(
            (category) => category.id == payload.id
        );
        state.categorys.splice(category, 1, payload);
    },
    removeCategory(state, payload) {
        state.categorys = state.categorys.filter(
            (category) => category.id != payload
        );
    },
    getCategory(state, payload) {
        state.category = payload;
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};