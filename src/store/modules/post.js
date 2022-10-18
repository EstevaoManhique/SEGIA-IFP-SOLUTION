import axios from '@/plugins/axios';

const state = {
    posts: [],
    post: {
        id: null,
        title: '',
        content: '',
        titulo: '',
        conteudo: '',
        img: '',
        online: true,
    },
    navegation: {
        preview: null,
        next: null,
    },
    relatedPosts: [],
};

const getters = {
    posts: (state) => state.posts,
    post: (state) => state.post,
    navegation: (state) => state.navegation,
    relatedPosts: (state) => state.relatedPosts,
};

const actions = {
    async fetchPosts({ commit }) {
        const response = await axios.get('posts');
        commit('setPosts', response.data);
    },
    async addPost({ commit }, post) {
        let data = new FormData();
        data.append('title', post.title);
        data.append('titulo', post.tituto);
        data.append('content', post.content);
        data.append('conteudo', post.conteudo);
        data.append('img', post.img);
        data.append('online', post.online);

        const response = await axios.post('post/store', data);

        commit('addPost', response.data);
    },
    async removePost({ commit }, id) {
        const response = await axios.delete(`post/${id}`);
        response.data;
        commit('removePost', id);
    },
    async updatePost({ commit }, post) {
        let data = new FormData();
        data.append('title', post.title);
        data.append('titulo', post.tituto);
        data.append('content', post.content);
        data.append('conteudo', post.conteudo);
        data.append('img', post.img);
        data.append('online', post.online);

        if (post.id) {
            data.append('id', post.id);
        }
        const response = await axios.put(`post/${post.id}`, post);
        response.data;
        commit('updatepost', post);
    },
    async setPost({ commit }, id) {
        const response = await axios.get(`post/${id}`);
        response.data;
        commit('setPost', response.data);
    },
    resetPost({ commit }) {
        commit('resetPost');
    },
};

const mutations = {
    setPosts: (state, payload) => {
        state.posts = payload;
        state.posts.sort((post1, post2) => post1.created_at - post2.created_at);
    },
    addPost(state, post) {
        state.posts.unshift(post);
        state.posts.sort((post1, post2) => post1.created_at - post2.created_at);
    },
    removePost(state, id) {
        state.posts = state.posts.filter((post) => post.id != id);
    },
    updatePost(state, payload) {
        let post = state.posts.findIndex((post) => post.id == payload.id);
        state.posts.splice(post, 1, payload);
    },
    setPost(state, payload) {
        state.post = payload;
    },
    resetPost(state) {
        state.post = {
            id: null,
            title: '',
            content: '',
            titulo: '',
            conteudo: '',
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