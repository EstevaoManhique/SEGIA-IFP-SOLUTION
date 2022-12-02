//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    subjects: [],
    subject: {
        id: null,
        cod: null,
        description: null,
        subject_category_id: null,
        subject_category: null,
    },
};

const getters = {
    subjects: (state) => state.subjects,
    subject: (state) => state.subject,
};

const actions = {
    async getSubjects({ commit }) {
        let res = await axios.get('subject');
        commit('getSubjects', res.data);
    },
    async addSubject({ commit }, subject) {
        const rsp = await axios.post('subject/store', subject);
        commit('addSubject', rsp.data);
    },
    async updateSubject({ commit }, subject) {
        const rsp = await axios.put('subject/' + subject.id, subject);

        commit('updateSubject', rsp.data.data);
    },
    async removeSubject({ commit }, subject) {
        const rsp = await axios.delete('subject/' + subject.id);

        commit('removeSubject', subject.id);
    },
    async getSubject({ commit }, subject) {
        const rsp = await axios.post('subject/' + subject.id);
        commit('getSubject', rsp.data);
    },
};

const mutations = {
    getSubjects(state, payload) {
        state.subjects = payload.sort((a, b) => a.cod.localeCompare(b.cod));
    },
    addSubject(state, payload) {
        state.subjects.push(payload.data);
    },
    updateSubject(state, payload) {
        let subject = state.subjects.findIndex(
            (subject) => subject.id == payload.id
        );
        state.subjects.splice(subject, 1, payload);
    },
    removeSubject(state, payload) {
        state.subjects = state.subjects.filter((subject) => subject.id != payload);
    },
    getSubject(state, payload) {
        state.subject = payload;
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};