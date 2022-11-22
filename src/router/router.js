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
            {
                path: '12classe',
                name: 'dashboard-12classe',
                component: () =>
                    import ('@/views/12classe/12a-dashboard.vue'),

                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'academico',
                name: 'dashboard-academico',
                component: () =>
                    import ('@/views/academico/HomeView.vue'),

                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'registar-alunos',
                name: 'academico-registar-aluno',
                component: () =>
                    import ('@/views/academico/aluno/AddStudent.vue'),

                meta: {
                    display: 'headers.registar_aluno',
                    display_title: 'menus.registar_aluno',
                },
            },
            {
                path: 'extraudinario',
                name: 'dashboard-extraudinario',
                component: () =>
                    import ('@/views/extraudinario/HomeView.vue'),

                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ieda',
                name: 'dashboard-ieda',
                component: () =>
                    import ('@/views/ieda/HomeView.vue'),

                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp',
                name: 'dashboard-ifp',
                component: () =>
                    import ('@/views/ifp/HomeView.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'acessos',
                name: 'dashboard-acessos',
                component: () =>
                    import ('@/views/acessos/HomeView.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'parametrizacao',
                name: 'dashboard-parametrizacao',
                component: () =>
                    import ('@/views/parametrizacao/HomeView.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
        ],
    },
    {
        path: '/12classe',
        component: {
            render(c) {
                return c('router-view');
            },
        },
        children: [{
            path: '/',
            name: 'home-12classe',
            component: () =>
                import ('@/views/12classe/12a-dashboard.vue'),

            meta: {
                display: 'headers.home',
                display_title: 'menus.home',
            },
        }, ],
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
