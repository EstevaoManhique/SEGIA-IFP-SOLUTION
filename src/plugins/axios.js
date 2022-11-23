import axios from 'axios';

//const API_URL = process.env.VUE_APP_ROOT_API;
const API_URL = 'http://localhost:8002/api/'; //'http://localhost:8001/api/';
//console.log(API_URL);
// const APP_KEY = process.env.VUE_APP_KEY

const api = axios.create({
    baseURL: API_URL,
    // timeout: 20000,
    headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer ' + localStorage.getItem('token'),
        // 'Q-AppID': APP_KEY
    },
});

api.interceptors.request.use((request) => {
    const locale = window.localStorage.language;

    request.headers.common['Accept-Language'] = locale ?
        JSON.parse(locale).locale :
        'pt';

    return request;
});

api.interceptors.response.use(
    (response) => {
        // document.getElementById("preloader").style.display = "none";
        // window.$('#app-container').removeClass('show-spinner')
        return Promise.resolve(response);
    },
    (error) => {
        return Promise.reject(error);
    }
);

export default api;