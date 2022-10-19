const state = {
    productDialog: false,
    postDialog: false,
    drawerDialog: false,
};

const getters = {
    productDialog: (state) => state.productDialog,
    postDialog: (state) => state.postDialog,
    drawerDialog: (state) => state.drawerDialog,
};

const actions = {
    createProductDialog({ commit }) {
        commit('createProductDialog');
    },
    setProductDialog({ commit }, payload) {
        commit('setProductDialog', payload);
    },
    createDrawerDialog({ commit }) {
        commit('createDrawerDialog');
    },
    setDrawerDialog({ commit }, payload) {
        commit('setDrawerDialog', payload);
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
    setDrawerDialog: (state, payload) => {
        state.drawerDialog = payload;
    },
    createDrawerDialog(state) {
        state.drawerDialog = true;
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