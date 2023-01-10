//import router from '@/router/router';
import axios from '@/plugins/axios';
import { Integer } from 'read-excel-file';

const state = {
    user: {},
    access:false,
};

const getters = {
    user: (state) => state.user,
    access: (state) => state.access,
};

const actions = {
    async getUser({ commit } ) {
        commit('getUser');
    },
    setUser({ commit }, user) {
        commit('setUser', user);
    },
    setAccess({ commit }, access) {
        commit('setAccess', access);
    }
};

const mutations = {
    getUser(state) {
        return state.user
    },
    setUser(state, payload) {
        state.user = payload
        state.access = true
        console.log("SetUser")
        console.log(state.user)
    },
    setAccess(state, payload) {
        state.access = payload
        console.log("SetAccess")
        console.log(state.access)
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};