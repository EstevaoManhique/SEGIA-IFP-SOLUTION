import axios from '@/plugins/axios';

const state = {
    services: [],
    service: {
        id: null,
        name: '',
        nome: '',
        description: '',
        descricao: '',
        price: '0',
        img: '',
        online: true,
    },
    onlineservices: [],
};

const getters = {
    services: (state) => state.services,
    service: (state) => state.service,
};

const actions = {
    async fetchServices({ commit }) {
        const response = await axios.get('services');
        commit('setServices', response.data);
    },
    async addService({ commit }, service) {
        let data = new FormData();
        data.append('name', service.name);
        data.append('nome', service.nome);
        data.append('description', service.description);
        data.append('descricao', service.descricao);
        data.append('price', service.price);
        data.append('img', service.img);
        data.append('online', service.online);

        const response = await axios.post('service/store', data);

        commit('addService', response.data);
    },
    async removeService({ commit }, id) {
        const response = await axios.delete(`service/${id}`);
        response.data;
        commit('removeService', id);
    },
    async updateService({ commit }, service) {
        let data = new FormData();
        data.append('name', service.name);
        data.append('nome', service.nome);
        data.append('description', service.description);
        data.append('descricao', service.descricao);
        data.append('price', service.price);
        data.append('img', service.img);
        data.append('online', service.online);
        if (service.id) {
            data.append('id', service.id);
        }
        const response = await axios.put(`service/${service.id}`, service);
        response.data;
        commit('updateService', service);
    },
    async setService({ commit }, id) {
        const response = await axios.get(`service/${id}`);
        response.data;
        commit('setService', response.data);
    },
    resetService({ commit }) {
        commit('resetService');
    },
};

const mutations = {
    setServices: (state, payload) => {
        state.services = payload;
        state.services.sort((service1, service2) =>
            service1.name.localeCompare(service2.name)
        );
    },
    addService(state, service) {
        state.services.unshift(service);
        state.services.sort((service1, service2) =>
            service1.name.localeCompare(service2.name)
        );
    },
    removeService(state, id) {
        state.services = state.services.filter((service) => service.id != id);
    },
    updateService(state, payload) {
        let service = state.services.findIndex(
            (service) => service.id == payload.id
        );
        state.services.splice(service, 1, payload);
    },
    setService(state, payload) {
        state.service = payload;
    },
    resetService(state) {
        state.service = {
            id: null,
            name: '',
            description: '',
            price: '',
            img: '',
            online: true,
        };
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};