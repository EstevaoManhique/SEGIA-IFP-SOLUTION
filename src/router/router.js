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
            },
            {
                path: '12a-aswer',
                name: '12a-aswer',
                component: () =>
                    import ('@/views/12classe/12a-aswer.vue'),

                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: '12a-calendar',
                name: '12a-calendar',
                component: () =>
                    import ('@/views/12classe/12a-calendar.vue'),

                meta: {
                    display: 'headers.12a_calendar',
                    display_title: 'menus.12a_calendar',
                },
            },
            {
                path: '12a-classroom',
                name: '12a-classroom',
                component: () =>
                    import ('@/views/12classe/12a-classroom.vue'),

                meta: {
                    display: 'headers.12a-classroom',
                    display_title: 'menus.12a-classroom',
                },
            },
            {
                path: '12a-jury',
                name: '12a-jury',
                component: () =>
                    import ('@/views/12classe/12a-jury.vue'),

                meta: {
                    display: 'headers.12a-jury',
                    display_title: 'menus.12a-jury',
                },
            },
            {
                path: '12a-list',
                name: '12a-list',
                component: () =>
                    import ('@/views/12classe/12a-list.vue'),

                meta: {
                    display: 'headers.12a-list',
                    display_title: 'menus.12a-list',
                },
            },
            {
                path: '12a-decoder',
                name: '12a-decoder',
                component: () =>
                    import ('@/views/12classe/12a-decoder.vue'),

                meta: {
                    display: 'headers.12a-decoder',
                    display_title: 'menus.12a-decoder',
                },
            },
            {
                path: '12a-guideline',
                name: '12a-guideline',
                component: () =>
                    import ('@/views/12classe/12a-guideline.vue'),

                meta: {
                    display: 'headers.12a-guideline',
                    display_title: 'menus.12a-guideline',
                },
            },
            {
                path: '12a-presences',
                name: '12a-presences',
                component: () =>
                    import ('@/views/12classe/12a-presences.vue'),

                meta: {
                    display: 'headers.12a-presences',
                    display_title: 'menus.12a-presences',
                },
            },
        ],
    },
    {
        path: '/acesso',
        component: {
            render(c) {
                return c('router-view');
            },
        },
        children: [{
                path: 'user-add',
                name: 'user-add',
                component: () =>
                    import ('@/views/acessos/user-add.vue'),

                meta: {
                    display: 'headers.user-add',
                    display_title: 'menus.user-add',
                },
            },
            {
                path: 'perfil',
                name: 'user-perfil',
                component: () =>
                    import ('@/views/user/UserPerfil.vue'),

                meta: {
                    display: 'headers.user-perfil',
                    display_title: 'menus.user-perfil',
                },
            },
            {
                path: 'user-blocked',
                name: 'user-blocked',
                component: () =>
                    import ('@/views/acessos/user-blocked.vue'),

                meta: {
                    display: 'headers.user-blocked',
                    display_title: 'menus.user-blocked',
                },
            },
            {
                path: 'user-first-login',
                name: 'user-first-login',
                component: () =>
                    import ('@/views/acessos/user-first-login.vue'),

                meta: {
                    display: 'headers.user-first-login',
                    display_title: 'menus.user-first-login',
                },
            },
            {
                path: 'user-logs',
                name: 'user-logs',
                component: () =>
                    import ('@/views/acessos/user-logs.vue'),

                meta: {
                    display: 'headers.user-logs',
                    display_title: 'menus.user-logs',
                },
            },
            {
                path: 'user-question',
                name: 'user-question',
                component: () =>
                    import ('@/views/acessos/user-question.vue'),

                meta: {
                    display: 'headers.user-question',
                    display_title: 'menus.user-question',
                },
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
