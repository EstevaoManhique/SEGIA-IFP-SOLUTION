//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    candidates: [],
    candidate: {
    
    }
};

const getters = {
    candidates: (state) => state.candidates,
    candidate: (state) => state.candidate,
};

const actions = {
    async getCandidates({ commit }) {
        let res = await axios.get('candidate');
        commit('getCandidates', res.data);
    },
    async addCandidate({ commit }, candidate) {
        const rsp = await axios.post('candidate/store', candidate);
        commit('addCandidate', rsp.data);
    },
    async removeCandidate({ commit }, candidate) {
        const rsp = await axios.delete('candidate/' + candidate);
        rsp.data;
        commit('removeCandidate', candidate);
    },
    async getCandidate({ commit }, candidate) {
        const rsp = await axios.get('candidate/' + candidate.id);
        commit('getCandidate', rsp.data);
    },
    async editCandidate({ commit }, candidate) {
        console.log("editedCandidate")
        console.log(candidate)
        const rsp = await axios.put('candidate/' + candidate.id, candidate);
        commit('editCandidate', rsp.data.data);
        console.log("Candidate edited");
        console.log(candidate)
    }
};

const mutations = {
    getCandidates(state, payload) {
        state.candidates = payload;
    },
    addCandidate(state, payload) {
        state.candidates.push(payload.data);
    },
    removeCandidate(state, payload) {
        state.candidates = state.candidates.filter((candidate) => candidate.id != payload);
    },
    getCandidate(state, payload) {
        state.candidate = payload;
    },
    editCandidate(state, payload) {
        let candidate = state.candidates.findIndex((candidate) => candidate.id == payload.id)
        state.candidates.splice(candidate, 1, payload);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};