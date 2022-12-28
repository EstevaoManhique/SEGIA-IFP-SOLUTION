//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    provinces: [],
    provincesName: [],
    province: {
        id: '',
        name: '',
        districts: [],
    },
    districts: [],
    districtsName: [],
    schoolsName: [],
    district: {
        id: '',
        name: '',
        province: {},
    },
};

const getters = {
    provinces: (state) => state.provinces,
    province: (state) => state.province,
    schoolsName: (state) => state.schoolsName,
    provincesName: (state) => state.provincesName,
    districts: (state) => state.districts,
    district: (state) => state.district,

    districtsName: (state) => state.districtsName,
};

const actions = {
    async getProvinces({ commit }) {
        let res = await axios.get('province');
        commit('getProvinces', res.data);
    },
    async initProvDist({ commit }) {
        let res = await axios.get('province');
        commit('getProvinces', res.data);
        let resp = await axios.get('district');
        // console.log(res.data);
        commit('getDistricts', resp.data);
    },

    async addProvince({ commit }, province) {
        let data = new FormData();
        data.append('name', province.name);
        data.append('cod', province.cod);

        const rsp = await axios.post('province/store', data);
        commit('addProvince', rsp.data);
    },
    async removeProvince({ commit }, province) {
        const rsp = await axios.delete('province/' + province);
        rsp.data;
        commit('removeProvince', province);
    },
    async getProvince({ commit }, province) {
        const rsp = await axios.get('province/' + province.id);
        commit('getProvince', rsp.data);
    },
    async editProvince({ commit }, province) {
        province.districts = '[]ação de Professores ' + new Date().getFullYear();
        const rsp = await axios.put('province/' + province.id, province);
        commit('editProvince', rsp.data.data);
    },
    setprovince({ commit }, province) {
        commit('setprovince', province);
    },
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
    changeProv({ commit }, value) {
        commit('changeProv', value);
    },
    changeDist({ commit }, value) {
        commit('changeDist', value);
    },
};

const mutations = {
    getProvinces(state, payload) {
        state.provinces = payload;
        state.provincesName = state.provinces.map((p) => {
            return { text: p.name, value: p.id, districts: p.districts };
        });
    },

    setProvince(state, payload) {
        state.province = payload;
    },
    empyprovince(state) {
        state.province = { id: null, name: null, cod: null, districts: [] };
    },
    addProvince(state, payload) {
        state.provinces.push(payload.data);
    },
    removeProvince(state, payload) {
        state.provinces = state.provinces.filter(
            (province) => province.id != payload
        );
    },
    getProvince(state, payload) {
        state.province = payload;
    },
    editProvince(state, payload) {
        let province = state.provinces.findIndex(
            (province) => province.id == payload.id
        );
        state.provinces.splice(province, 1, payload);
    },
    getDistricts(state, payload) {
        state.districts = payload;
        // state.districtName = state.district.map((p) => {
        //      return { text: p.name, value: p.id };
        //  });
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
    changeProv(state, payload) {
        let prov = state.provinces.filter((p) => p.id == payload)[0];
        // state.districts = prov.districts;
        state.districtsName = prov.districts.map((p) => {
            return { text: p.name, value: p.id };
        });
        state.schoolsName = [];
    },
    changeDist(state, payload) {
        let dist = state.districts.filter((p) => p.id == payload)[0];
        state.schoolsName = dist.schools.map((s) => {
            return { text: s.name, value: s.id };
        });
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};
