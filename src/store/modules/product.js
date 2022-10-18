import axios from '@/plugins/axios';

const state = {
    products: [],
    product: {
        id: null,
        name: '',
        description: '',
        price: '',
        img: '',
        online: true,
    },
    onlineProducts: [],
};

const getters = {
    products: (state) => state.products,
    product: (state) => state.product,
};

const actions = {
    async fetchProducts({ commit }) {
        const response = await axios.get('products');
        commit('setProducts', response.data);
    },
    async addProduct({ commit }, product) {
        let data = new FormData();
        data.append('name', product.name);
        data.append('description', product.description);
        data.append('price', product.price);
        data.append('img', product.img);
        data.append('online', product.online);

        const response = await axios.post('product/store', data);

        commit('addProduct', response.data);
    },
    async removeProduct({ commit }, id) {
        const response = await axios.delete(`product/${id}`);
        response.data;
        commit('removeProduct', id);
    },
    async updateProduct({ commit }, product) {
        let data = new FormData();
        data.append('name', product.name);
        data.append('description', product.description);
        data.append('price', product.price);
        data.append('img', product.img);
        data.append('online', product.online);

        if (product.id) {
            data.append('id', product.id);
        }
        const response = await axios.put(`product/${product.id}`, product);
        response.data;
        commit('updateProduct', product);
    },
    async setProduct({ commit }, id) {
        const response = await axios.get(`product/${id}`);
        response.data;
        commit('setProduct', response.data);
    },
    resetProduct({ commit }) {
        commit('resetProduct');
    },
};

const mutations = {
    setProducts: (state, payload) => {
        state.products = payload;
        state.products.sort((product1, product2) =>
            product1.name.localeCompare(product2.name)
        );
    },
    addProduct(state, product) {
        state.products.unshift(product);
        state.products.sort((product1, product2) =>
            product1.name.localeCompare(product2.name)
        );
    },
    removeProduct(state, id) {
        state.products = state.products.filter((product) => product.id != id);
    },
    updateProduct(state, payload) {
        let product = state.products.findIndex(
            (product) => product.id == payload.id
        );
        state.products.splice(product, 1, payload);
    },
    setProduct(state, payload) {
        state.product = payload;
    },
    resetProduct(state) {
        state.product = {
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