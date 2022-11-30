//import axios from "axios";
import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    users: [],
    user: null,
    token: null,
};

const getters = {
    users: (state) => state.users,
    user: (state) => state.user,
    isLoggedIn: (state) => state.token,
};

const actions = {
    async allUser({ commit }) {
        let response = await axios.get('users');
        commit('users', response.data);
    },
    async getUser({ commit }) {
        let response = await axios.get('user');
        commit('user', response.data);
    },
    async login({ commit }, user) {
        let data = new FormData();
        data.append('email', user.email);
        data.append('password', user.password);

        const response = await axios.post('login', data);
        localStorage.setItem('token', response.data.token);
        commit('user', response.data.user);
        commit('token', response.data.token);
    },
    async addUser({ commit }, user) {
        let data = new FormData();
        data.append('email', user.email);
        data.append('password', user.name + '' + user.surname);
        data.append('name', user.name);
        data.append('surname', user.surname);
        const response = await axios.post('register', data);

        commit('addUser', response.data.data);
    },
    async removeUser({ commit }, user) {
        const response = await axios.delete('user/' + user.id, user);
        commit('removeUser', user);
    },
    async updateUser({ commit }, user) {
        const response = await axios.put('user/' + user.id, user);
        commit('updateUser', response.data);
    },
    logout({ commit }) {
        commit('logout');
    },
};

const mutations = {
    token(state, token) {
        state.token = token;
    },
    user(state, user) {
        state.user = user[0];
    },
    users(state, users) {
        state.users = users;
    },
    addUser(state, payload) {
        state.users.push(payload);
    },
    removeUser(state, payload) {
        state.users = state.users.filter((user) => user.id != payload.id);
    },
    updateUser(state, payload) {
        let user = state.users.findIndex((user) => user.id == payload.id);
        state.users.splice(user, 1, payload);
    },
    logout(state) {
        state.user = null;
        localStorage.removeItem('token');
        router.replace('/');
    },
};

export default {
    state,
    getters,
    actions,
    mutations,
};