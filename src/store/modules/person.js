//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    persons: [],
    person: {
        id: null,
        name: null,
        surname: null,
        genre: null,
        marital_status: null,
        mother_name: null,
        father_name: null,
        mother_contact: null,
        father_contact: null,
        birth_date: null,
        BI_number: null,
        BI_expiration_date: null,
        BI_issue_date: null,
        nuit: null,
        email: null,
        contact: null,
        nationality_id: null,
        profile_picture: null,
        cPostal: null,
        city: null,
        district: null,
        province: null,
        numero_casa: null,
        address: null,
    },
};

const getters = {
    persons: (state) => state.persons,
    person: (state) => state.person,
};

const actions = {
    async getPersons({ commit }) {
        let res = await axios.get('person');
        commit('getPersons', res.data);
    },
    async addPerson({ commit }, person) {
        const rsp = await axios.post('person/store', person);
        commit('addPerson', rsp.data);
    },
    async removePerson({ commit }, person) {
        const rsp = await axios.delete('person/' + person.id);
        rsp.data;
        commit('removePerson', person.id);
    },
    async getPerson({ commit }, person) {
        const rsp = await axios.get('person/' + person.id);
        commit('getPerson', rsp.data);
    },
    async updatePerson({ commit }, person) {
        const rsp = await axios.put('person/' + person.id, person);
        commit('updatePerson', rsp.data);
    },
};

const mutations = {
    getPersons(state, payload) {
        state.persons = payload;
    },
    addPerson(state, payload) {
        state.persons.push(payload.data);
    },
    removePerson(state, payload) {
        state.persons = state.persons.filter((person) => person.id != payload);
    },
    getPerson(state, payload) {
        state.person = payload;
    },
    updatePerson(state, payload) {
        let person = state.persons.findIndex((person) => person.id == payload.id);
        state.persons.splice(person, 1, payload);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};