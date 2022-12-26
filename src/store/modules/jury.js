//import router from '@/router/router';
import axios from '@/plugins/axios';
import { Integer } from 'read-excel-file';

const state = {
    jurys: [],
    jury: {},
};

const getters = {
    jurys: (state) => state.jurys,
    jury: (state) => state.jury,
};

const actions = {
    async getJurys({ commit }   ) {
        let res = await axios.get('jury');
        commit('getJurys', res.data);
    },
    async addJury({ commit }, jury) {
        const rsp = await axios.post('jury/store', jury);
        commit('addJury', rsp.data);
    },
    async removeJury({ commit }, jury) {
        const rsp = await axios.delete('jury/' + jury);
        rsp.data;
        commit('removeJury', jury);
    },
    async getJury({ commit }, jury) {
        const rsp = await axios.get('jury/' + jury.id);
        commit('getJury', rsp.data);
    },
    async editJury({ commit }, jury) {
        const rsp = await axios.put('jury/' + jury.id, jury);
        commit('editJury', rsp.data.data);
    }
};

const mutations = {
    getJurys(state, payload) {
        state.jurys = payload

        console.log("Jurisjfjfjj")
        console.log(state.jurys)
    },
    addJury(state, payload) {
        state.jurys.push(payload.data[0]);
    },
    removeJury(state, payload) {
        state.jurys = state.jurys.filter((jury) => jury.id != payload);
    },
    getJury(state, payload) {
        state.jury = payload;
    },
    editJury(state, payload) {
        state.jurys.splice(jury, 1, payload[0]);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};