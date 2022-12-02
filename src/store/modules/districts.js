//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    districts: [],
    districtsname: [],
    schoolsname: [],
    districtname: null,
    empydistrict: {
        id: null,
        name: null,
        cod: null,
        schoolsname: []
    },
};

const getters = {
    districts: (state) => state.districts,
    district: (state) => state.district,
    empydistrict: (state) => state.empydistrict,
    districtsname: (state) => state.districtsname,
    schoolsname: (state) => state.schoolsname
};

const actions = {
    async getDistricts({ commit }) {
        let res = await axios.get('district');
        console.log(res.data);
        commit('getDistricts', res.data);
    },
    async getDistricts({ commit }, district) {
       commit('getDistricts', district);
    },
    async adddistrict({ commit }, district) {
        let data = new FormData();
        data.append('name', district.name);
        data.append('cod', district.cod);

        const rsp = await axios.post('district/store', data);
        commit('adddistrict', rsp.data);
    },
    async removedistrict({ commit }, district) {
        const rsp = await axios.delete('district/' + district);
        rsp.data;
        commit('removedistrict', district);
    },
    async getDistrict({ commit }, district) {
        const rsp = await axios.get('district/' + district.id);
        commit('getDistrict', rsp.data);
    },
    async editDistrict({ commit }, district) {
        district.districts='[]ação de Professores '+(new Date().getFullYear());
        const rsp = await axios.put('district/' + district.id, district);
        commit('editDistrict', rsp.data.data);

    },
    setDistrict({ commit }, district){
        commit('setDistrict',district)
    },
    empydistrict({commit}){
        console.log('Empy');
        commit('empydistrict');
    }
};

const mutations = {
    getDistricts(state, payload) {
        state.districts = payload
        console.log(payload)
        state.districtsname = payload.map(district => {return district.name})
    },
    getDistricts(state, payload) {
        let district = state.districts.filter(district => district.name == payload)[0]
        state.schoolsname = district.districts.map((district) =>{ return district.name})
    },
    setDistrict(state, payload) {
        state.district = payload;
    },
    empydistrict(state){
        state.district={id: null,
            name: null,
            cod: null,
            districts: []};
    },
    adddistrict(state, payload) {
        state.districts.push(payload.data);
    },
    removedistrict(state, payload) {
        state.districts = state.districts.filter((district) => district.id != payload);
    },
    getDistrict(state, payload) {
        state.district = payload;
    },
    editDistrict(state, payload) {
        let district = state.districts.findIndex((district) => district.id == payload.id)
        state.districts.splice(district, 1, payload);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};