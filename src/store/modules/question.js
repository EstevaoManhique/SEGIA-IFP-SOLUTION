//import router from '@/router/router';
import axios from '@/plugins/axios';

const state = {
    questions: [],
    question: {},
    questionsByExam:[]
};

const getters = {
    questions: (state) => state.questions,
    question: (state) => state.question,
    questionsByExam: (state) => state.questionsByExam,
};

const actions = {
    async getQuestions({ commit }) {
        let res = await axios.get('question');
        console.log(res.data);
        commit('getQuestions', res.data);
    },
    async getQuestionsByExam({ commit }, idExam) {
        console.log("Try"+idExam)
        let res = await axios.get('question/questionsByExam/'+idExam);
        console.log(res.data);
        commit('getQuestionsByExam', res.data);
    },
    async addQuestions({ commit }, question) {
        const rsp = await axios.post('question/store', question);
        commit('addQuestions', rsp.data);
    },
    async removeQuestion({ commit }, question) {
        const rsp = await axios.delete('question/' + question);
        rsp.data;
        commit('removeQuestion', question);
    },
    async getQuestion({ commit }, question) {
        const rsp = await axios.get('question/' + question.id);
        commit('getQuestion', rsp.data);
    },
    async editQuestion({ commit }, question) {
        question.description='Formação de Professores '+(new Date().getFullYear());
        const rsp = await axios.put('ifpquestion/' + question.id, question);
        commit('editQuestion', rsp.data.data);
    },
};

const mutations = {
    getQuestions(state, payload) {
        state.questions = payload;
        console.log("get Questions")
        console.log(state.questions)
    },
    getQuestionsByExam(state, payload) {
        state.questionsByExam = payload;
        console.log("get Questions By Exam")
        console.log(state.questions)
    },
    addQuestions(state, payload) {
        state.questions.push(payload.data);
        console.log(payload.data)
    },
    removeQuestion(state, payload) {
        state.questions = state.questions.filter((question) => question.id != payload);
    },
    getQuestion(state, payload) {
        state.question = payload;
    },
    editQuestion(state, payload) {
        let question = state.questions.findIndex((question) => question.id == payload.id)
        state.questions.splice(question, 1, payload);
    },
};
export default {
    state,
    getters,
    mutations,
    actions,
};