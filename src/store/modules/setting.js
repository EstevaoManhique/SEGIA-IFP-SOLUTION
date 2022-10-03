const state = {
    drawer: true,
};

const getters = {
    drawer: (state) => state.drawer,
};

const actions = {
    setDrawer({ commit }) {
        commit('setDrawer');
    },
    createDrawer({ commit }) {
        commit('createDrawer');
    },
};

const mutations = {
    setDrawer: (state) => {
        state.drawer = !state.drawer;
    },
    createDrawer: (state) => {
        state.drawer = true;
    },
};

export default {
    state,
    getters,
    mutations,
    actions,
};