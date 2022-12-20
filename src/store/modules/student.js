//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    students: [],
    student: {
        id: null,
        person_id: null,
        school_id: null,
        cod: null,
        created_at: null,
        update_at: null,
        person: null,
    },
};

const getters = {
    students: (state) => state.students,
    student: (state) => state.student,
};

const actions = {
    async getStudents({ commit }) {
        let res = await axios.get('student');
        commit('getStudents', res.data);
    },
    async addStudent({ commit }, student) {
        const rsp = await axios.post('student/store', student);

        commit('addStudent', rsp.data);
    },
    async removeStudent({ commit }, student) {
        const rsp = await axios.delete('student/' + student.id);
        rsp.data;
        commit('removeStudent', student.id);
    },
    async getStudent({ commit }, student) {
        const rsp = await axios.post('student/' + student.id);
        commit('getStudent', rsp.data);
    },
};

const mutations = {
    getStudents(state, payload) {
        state.students = payload;
    },
    addStudent(state, payload) {
        state.students.push(payload.data);
    },
    removeStudent(state, payload) {
        state.students = state.students.filter((student) => student.id != payload);
    },
    getStudent(state, payload) {
        state.student = payload;
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};