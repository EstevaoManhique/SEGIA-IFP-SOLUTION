//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    avaliacoes: [],
    pauta: [],
    avaliacao: {
    },
    avalImported:[],
    avalByCourse:[],
    jurys2ByCourse:[],
    abyjury:[],
};

const getters = {
    avaliacoes: (state) => state.avaliacoes,
    pauta: (state) => state.pauta,
    avaliacao: (state) => state.avaliacao,
    avalImported: (state) => state.avalImported,
    avalByCourse: (state) => state.avalByCourse,
    jurys2ByCourse: (state) => state.jurys2ByCourse,
    abyjury: (state) => state.abyjury,
};

const actions = {
    async getAvaliacoes({ commit }) {
        let res = await axios.get('avaliation');
        console.log(res.data);
        commit('getAvaliacoes', res.data);
    },
    async getAvaliacoesByCourse({ commit }, ifpId) {
        let res = await axios.get('avaliation/bycourse/'+ifpId);
        commit('getAvaliacoesByCourse', res.data);
    },
    async getAvaliacoesByJury({ commit}, id) {
        let res = await axios.get('avaliation/byjury/'+id);
        commit('getAvaliacoesByJury', res.data);
    },
    async addAvaliacao({ commit }, avaliacao) {
        const rsp = await axios.post('avaliation/store', avaliacao);
        commit('addAvaliacao', rsp.data);
    },
    async addAvaliacoes({ commit }, avaliacoes) {
        const rsp = await axios.post('avaliation/storeMany', avaliacoes);
        commit('addAvaliacoes', rsp.data);
    },
    async removeAvaliacao({ commit }, avaliacao) {
        const rsp = await axios.delete('avaliation/' + avaliacao);
        rsp.data;
        commit('removeAvaliacao', avaliacao);
    },
    async generateJurys2({ commit }, candidates) {
        const rsp = await axios.post('avaliation/createjury', candidates);
        commit('generateJurys2', rsp.data);
    },
    async getAvaliacao({ commit }, avaliacao) {
        const rsp = await axios.get('avaliation/' + avaliacao.id);
        commit('getAvaliacao', rsp.data);
    },
    async getAvaliacoesBySchool({ commit }, id) {
        const rsp = await axios.get('avaliation/bySchool/' + id);
        console.log("Response avaliacoes by School")
        console.log(rsp.data)
        commit('getAvaliacoesBySchool', rsp.data);
    },
    async getPauta({ commit }, id) {
        const rsp = await axios.get('avaliation/pauta/' + id);
        console.log("Response pauta by School")
        console.log(rsp.data)
        commit('getPauta', rsp.data);
    },
    async editAvaliacao({ commit }, avaliacao) {
        const rsp = await axios.put('avaliation/' + avaliacao.id, avaliacao);
        commit('editAvaliacao', rsp.data.data);
    },
};

const mutations = {
    getAvaliacoesByCourse(state, payload) {
        state.avalByCourse = payload;
        console.log("avaliation by course")
        console.log(state.avalByCourse)
    },
    getAvaliacoes(state, payload) {
        console.log("getAvaliacoes")
        console.log(payload)
        
        state.avaliacoes = payload
        console.log("Avaliacoes com estado")
        console.log(state.avaliacoes)


        state.avaliacoes.map((a) => {
            let media = 0
            if((a.portugues>=12) && (a.matematica>=12)){
                media = (a.portugues + a.matematica)/2
                a.state = "Admitido"
                a.media = media
            }else{
                media = (a.portugues + a.matematica)/2
                a.state = "Excluido"
                a.media = media
            }
            console.log(a)
        })

    },
    generateJurys2(state, payload) {
        state.jurys2ByCourse = payload.data
        console.log(state.jurys2ByCourse)
    },
    addAvaliacao(state, payload) {
        state.avaliacoes.push(payload);
        console.log("add Avaliacao")
        console.log(payload)
    },
    addAvaliacoes(state, payload) {
        state.avalImported = payload.data;
        console.log("add Avaliacoes Importadas")
        console.log(state.avalImported)
    },
    removeAvaliacao(state, payload) {
        state.avaliacoes = state.avaliacoes.filter((avaliacao) => avaliacao.id != payload);
    },
    getAvaliacao(state, payload) {
        state.avaliacao = payload;
    },
    editAvaliacao(state, payload) {
        let avaliacao = state.avaliacoes.findIndex((avaliacao) => avaliacao.id == payload.id)
        state.avaliacoes.splice(avaliacao, 1, payload);
    },
    getAvaliacoesByJury(state, payload) {
        state.abyjury= payload;
    },
    getAvaliacoesBySchool(state, payload) {
        console.log("getAvaliacoesBySchool")
        console.log(payload)
        
        state.avaliacoes = payload

        state.avaliacoes.map((a) => {
            let media = 0
            if((a.portugues>=12) && (a.matematica>=12)){
                media = (a.portugues + a.matematica)/2
                a.state = "Admitido"
                a.media = media
            }else{
                media = (a.portugues + a.matematica)/2
                a.state = "Excluido"
                a.media = media
            }
            console.log(a)
        })

    },
    getPauta(state, payload) {
        console.log("getPauta")
        console.log(payload)
        
        state.pauta = payload

    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};