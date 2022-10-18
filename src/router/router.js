import Vue from 'vue';
import Router from 'vue-router';
import Home from '@/views/HomeView.vue';
import i18n from '@/i18n';

Vue.use(Router);

const routes = [{
        path: '/',
        redirect: `/${i18n.locale}`,
    },
    {
        path: '/:lang',
        component: {
            render(c) {
                return c('router-view');
            },
        },
        children: [{
                path: '/',
                name: 'home',
                component: Home,
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'about',
                name: 'about',
                meta: {
                    display: 'headers.about',
                    display_title: 'menus.about',
                },
                // route level code-splitting
                // this generates a separate chunk (about.[hash].js) for this route
                // which is lazy-loaded when the route is visited.
                component: () =>
                    import ( /* webpackChunkName: "about" */ '@/views/AboutView.vue'),
            },
            {
                path: 'login',
                name: 'login',
                meta: {
                    display: 'headers.login',
                    display_title: 'menu.login',
                },

                // route level code-splitting
                // this generates a separate chunk (about.[hash].js) for this route
                // which is lazy-loaded when the route is visited.
                component: () =>
                    import ('@/components/layout/Login.vue'),
            },
            {
                path: 'logout',
                name: 'logout',
                meta: {
                    display: 'headers.logout',
                    display_title: 'menus.logout',
                },
                // route level code-splitting
                // this generates a separate chunk (about.[hash].js) for this route
                // which is lazy-loaded when the route is visited.
                component: () =>
                    import ('@/components/layout/Logout.vue'),
            },
            {
                path: 'contact',
                name: 'contact',
                meta: {
                    display: 'headers.contact',
                    display_title: 'menus.contact',
                },
                component: () =>
                    import ('@/views/Contact.vue'),
            },
            {
                path: 'product',
                name: 'product',
                meta: {
                    display: 'headers.product',
                    display_title: 'menus.product',
                },
                component: () =>
                    import ('@/views/ProductView.vue'),
            },
            {
                path: 'post',
                name: 'post',
                meta: {
                    display: 'headers.post',
                    display_title: 'menus.post',
                },
                component: () =>
                    import ('@/views/PostView.vue'),
            },
            {
                path: 'post/:id',
                name: 'post-item',
                meta: {
                    display: 'headers.post',
                    display_title: 'menus.post',
                },
                component: () =>
                    import ('@/views/PostItem.vue'),
            },
            {
                path: 'service',
                name: 'service',
                meta: {
                    display: 'headers.service',
                    display_title: 'menus.service',
                },
                component: () =>
                    import ('@/views/ServiceView.vue'),
            },
            {
                path: 'network',
                name: 'network',
                meta: {
                    display: 'headers.network',
                    display_title: 'menus.network',
                },
                component: () =>
                    import ('@/views/NetworkView.vue'),
            },
        ],
    },
];

const router = new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    scrollBehavior(to) {
        if (to.hash) {
            return {
                selector: to.hash,
                behavior: 'smooth',
            };
        }
        return { x: 0, y: 0, behavior: 'smooth' };
    },
    routes,
});

router.afterEach((to) => {
    if (to.name && to.meta.display) {
        document.title = to.meta.display ?
            i18n.tc(to.meta.display_title, 2) :
            process.env.APP_NAME;
    }
});

export default router;