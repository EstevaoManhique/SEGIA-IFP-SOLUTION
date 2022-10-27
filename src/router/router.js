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