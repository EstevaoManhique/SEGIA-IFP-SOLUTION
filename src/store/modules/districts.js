//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    district: [],
    districtsName: [],
   
};

const getters = {
    district: (state) => state.district,
    districtsName: (state) => state.districtsName,
};

const actions = {
    async getDistricts({ commit }) {
        let res = await axios.get('district');
        // console.log(res.data);
        commit('getDistricts', res.data);
    },

    async addDistrict({ commit }, district) {
        let data = new FormData();
        data.append('name', district.name);
        data.append('cod', district.cod);

        const rsp = await axios.post('district/store', data);
        commit('addDistrict', rsp.data);
    },
    async removeDistrict({ commit }, district) {
        const rsp = await axios.delete('district/' + district);
        rsp.data;
        commit('removeDistrict', district);
    },
    async getDistrict({ commit }, district) {
        const rsp = await axios.get('district/' + district.id);
        commit('getDistrict', rsp.data);
    },
    async editDistrict({ commit }, district) {
        district.districts = '[]ação de Professores ' + new Date().getFullYear();
        const rsp = await axios.put('district/' + district.id, district);
        commit('editDistrict', rsp.data.data);
    },
    setDistrict({ commit }, district) {
        commit('setDistrict', district);
    },
    setDistricts({ commit }, districts) {
        commit('setDistricts', districts);
    },
};

const mutations = {
    getDistricts(state, payload) {
        state.district = payload;
        console.log("kcdkmkndnck")
        console.log(state.district)
        console.log(payload)
        state.districtName = state.district.map((p) => {
            return { text: p.name, value: p.id };
        });
    },
    setDistricts(state, payload) {
        state.districts = payload;
        state.districtsName = state.districts.map((p) => {
            return { text: p.name, value: p.id };
        });
    },
    setDistrict(state, payload) {
        state.district = payload;
    },
    empydistrict(state) {
        state.district = { id: null, name: null, cod: null, districts: [] };
    },
    addDistrict(state, payload) {
        state.districts.push(payload.data);
    },
    removeDistrict(state, payload) {
        state.districts = state.districts.filter(
            (district) => district.id != payload
        );
    },
    getDistrict(state, payload) {
        state.district = payload;
    },
    editDistrict(state, payload) {
        let district = state.districts.findIndex(
            (district) => district.id == payload.id
        );
        state.districts.splice(district, 1, payload);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};