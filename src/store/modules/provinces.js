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
};

const getters = {
    provinces: (state) => state.provinces,
    province: (state) => state.province,

    provincesName: (state) => state.provincesName,
};

const actions = {
    async getProvinces({ commit }) {
        let res = await axios.get('province');
        console.log(res.data);
        commit('getProvinces', res.data);
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
};
export default {
    state,
    getters,
    mutations,
    actions,
};