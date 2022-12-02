//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    provinces: [],
    provincesname: [],
    districtsname: [],
    provincename: null,
    empyprovince: {
        id: null,
        name: null,
        cod: null,
        districtsname: []
    },
};

const getters = {
    provinces: (state) => state.provinces,
    province: (state) => state.province,
    empyprovince: (state) => state.empyprovince,
    provincesname: (state) => state.provincesname,
    districtsname: (state) => state.districtsname
};

const actions = {
    async getProvinces({ commit }) {
        let res = await axios.get('province');
        console.log(res.data);
        commit('getProvinces', res.data);
    },
    async getDistricts({ commit }, province) {
       commit('getDistricts', province);
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
        province.districts='[]ação de Professores '+(new Date().getFullYear());
        const rsp = await axios.put('province/' + province.id, province);
        commit('editProvince', rsp.data.data);

    },
    setprovince({ commit }, province){
        commit('setprovince',province)
    },
    empyprovince({commit}){
        console.log('Empy');
        commit('empyprovince');
    }
};

const mutations = {
    getProvinces(state, payload) {
        state.provinces = payload
        payload.map(province => state.provincesname.push(province.name))
    },
    getDistricts(state, payload) {
        let province = state.provinces.filter(province => province.name == payload)[0]
        state.districtsname =province.districts.map((district) =>{ return district.name})
    },
    setprovince(state, payload) {
        state.province = payload;
    },
    empyprovince(state){
        state.province={id: null,
            name: null,
            cod: null,
            districts: []};
    },
    addProvince(state, payload) {
        state.provinces.push(payload.data);
    },
    removeProvince(state, payload) {
        state.provinces = state.provinces.filter((province) => province.id != payload);
    },
    getProvince(state, payload) {
        state.province = payload;
    },
    editProvince(state, payload) {
        let province = state.provinces.findIndex((province) => province.id == payload.id)
        state.provinces.splice(province, 1, payload);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};