//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    teachers: [],
    teacher: {
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
    allTeachers: (state) => state.teachers,
    teacher: (state) => state.teacher,
};

const actions = {
    async getTeachers({ commit }) {
        let res = await axios.get('teacher');
        commit('getTeachers', res.data);
    },
    async addTeacher({ commit }, teacher) {
        let data = new FormData();
        data.append('name', teacher.name);
        data.append('surname', teacher.surname);
        data.append('school_id', teacher.school_id);

        const rsp = await axios.post('teacher/store', data);
        commit('addTeacher', rsp.data);
    },
    async removeTeacher({ commit }, teacher) {
        const rsp = await axios.delete('teacher/' + teacher.id);
        rsp.data;
        commit('removeTeacher', teacher.id);
    },
    async getTeacher({ commit }, teacher) {
        const rsp = await axios.post('teacher/' + teacher.id);
        commit('getTeacher', rsp.data);
    },
};

const mutations = {
    getTeachers(state, payload) {
        state.teachers = payload;
    },
    addTeacher(state, payload) {
        state.teachers.push(payload.data);
    },
    removeTeacher(state, payload) {
        state.teachers = state.teachers.filter((teacher) => teacher.id != payload);
    },
    getTeacher(state, payload) {
        state.teacher = payload;
    },
};

export default {
    state,
    getters,
    mutations,
    actions,
};