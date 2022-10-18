const state = {
    productDialog: false,
};

const getters = {
    productDialog: (state) => state.productDialog,
};

const actions = {
    createProductDialog({ commit }) {
        commit('createProductDialog');
    },
    setProductDialog({ commit }, payload) {
        commit('setProductDialog', payload);
    },
};
const mutations = {
    setProductDialog: (state, payload) => {
        state.productDialog = payload;
    },
    createProductDialog(state) {
        state.productDialog = false;
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};