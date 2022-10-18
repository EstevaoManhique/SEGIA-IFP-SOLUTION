const state = {
    productDialog: false,
    postDialog: false,
};

const getters = {
    productDialog: (state) => state.productDialog,
    postDialog: (state) => state.postDialog,
};

const actions = {
    createProductDialog({ commit }) {
        commit('createProductDialog');
    },
    setProductDialog({ commit }, payload) {
        commit('setProductDialog', payload);
    },
    createPostDialog({ commit }) {
        commit('createPostDialog');
    },
    setPostDialog({ commit }, payload) {
        commit('setPostDialog', payload);
    },
};
const mutations = {
    setProductDialog: (state, payload) => {
        state.productDialog = payload;
    },
    createProductDialog(state) {
        state.productDialog = false;
    },
    setPostDialog: (state, payload) => {
        state.postDialog = payload;
    },
    createPostDialog(state) {
        state.postDialog = false;
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};