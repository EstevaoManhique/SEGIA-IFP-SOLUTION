//import router from '@/router/router';
import axios from '@/plugins/axios';
import { Integer } from 'read-excel-file';

const state = {
    candidates: [],
    imported: [],
    candidate: {},
    data:null,
    bycourse:[],
    cbyjury:[],
    jurysByCourse:[]
};

const getters = {
    candidates: (state) => state.candidates,
    candidate: (state) => state.candidate,
    imported: (state) => state.imported,
    data: (state) => state.data,
    bycourse: (state) => state.bycourse,
    cbyjury: (state) => state.cbyjury, 
    jurysByCourse: (state) => state.jurysByCourse
};

const actions = {
    async getCandidates({ commit }) {
        let res = await axios.get('candidate');
        commit('getCandidates', res.data);
    },
    async getCandidatesByCourse({ commit }, ifpId) {
        let res = await axios.get('candidate/bycourse/'+ifpId);
        commit('getCandidatesByCourse', res.data);
    },
    async getCandidatesBySchool({ commit }, schoolId) {
        let res = await axios.get('candidate/byschool/'+schoolId);
        commit('getCandidatesBySchool', res.data);
    },
    async getCandidatesByJury({ commit}, id) {
        let res = await axios.get('candidate/byjury/'+id);
        commit('getCandidatesByJury', res.data);
    },
    async addCandidate({ commit }, candidate) {
        const rsp = await axios.post('candidate/store', candidate);
        commit('addCandidate', rsp.data);
    },
    async addCandidates({ commit }, candidates) {
        const rsp = await axios.post('candidate/storemany', candidates);
        commit('addCandidates', rsp.data);
    },
    async generateJurys({ commit }, candidates) {
        const rsp = await axios.post('candidate/createjury', candidates);
        commit('generateJurys', rsp.data);
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
        const rsp = await axios.put('candidate/' + candidate.id, candidate);
        commit('editCandidate', rsp.data.data);
    }
};

const mutations = {
    /*getCandidates(state, payload) {
        state.candidates = payload;
        payload.sort((a,b) => (a.nome < b.nome) ? 1 : ((b.nome < a.nome) ? -1 : 0))
        
        state.candidates.map((candidate) => {
            candidate.isValidated ? candidate.state = "VALIDADO": 
            candidate.state = "PENDENTE"
        })

        console.log("getCandidatesAAAAA")
    },*/
    getCandidatesByCourse(state, payload) {
        state.bycourse = payload;
        console.log("by course")
        console.log(state.bycourse)
    },
    getCandidatesBySchool(state, payload) {
        state.candidates = payload;
        console.log("by School")
        console.log(state.candidates)

        state.candidates = payload;
        payload.sort((a,b) => (a.nome < b.nome) ? 1 : ((b.nome < a.nome) ? -1 : 0))
        
        state.candidates.map((candidate) => {
            candidate.isValidated ? candidate.state = "VALIDADO": 
            candidate.state = "PENDENTE"
        })

        console.log("getCandidatesAAAAA")
    },
    getCandidatesByJury(state, payload) {
        state.cbyjury= payload;
    },
    addCandidate(state, payload) {
        payload.data[0].state = "PENDENTE"
        state.candidates.push(payload.data[0]);
    },
    generateJurys(state, payload) {
        state.jurysByCourse = payload.data
        console.log(state.jurysByCourse)
    },
    addCandidates(state, payload) {
        console.log("Candidates")
        console.log(payload)
        
        payload.data.map((c)=>{
            c.state = "VALIDADO"
            state.imported.push(c)         
        })
        state.data = payload
        console.log("Data")
        console.log(state.data)
        
    },
    removeCandidate(state, payload) {
        state.candidates = state.candidates.filter((candidate) => candidate.id != payload);
    },
    getCandidate(state, payload) {
        state.candidate = payload;
    },
    editCandidate(state, payload) {
        let candidate = state.candidates.findIndex((candidate) => candidate.id == payload[0].id)
        payload[0].isValidated ? payload[0].state = "VALIDADO":payload[0].state = "PENDENTE"
        state.candidates.splice(candidate, 1, payload[0]);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};