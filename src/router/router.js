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
            import('@/components/layout/Login.vue'),
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
            import('@/components/layout/Logout.vue'),
    },
    {
        path: '12classe',
        name: 'dashboard-12classe',
        component: () =>
            import('@/views/12classe/12a-dashboard.vue'),

        meta: {
            display: 'headers.home',
            display_title: 'menus.home',
        },
    },
    {
        path: 'ieda',
        name: 'dashboard-ieda',
        component: () =>
            import('@/views/ieda/HomeView.vue'),

        meta: {
            display: 'headers.home',
            display_title: 'menus.home',
        },
    },
    {
        path: 'ifp',
        name: 'dashboard-ifp',
        component: () =>
            import('@/views/ifp/HomeView.vue'),
        meta: {
            display: 'headers.home',
            display_title: 'menus.home',
        },
    },
    {
        path: 'acessos',
        name: 'dashboard-acessos',
        component: () =>
            import('@/views/acessos/HomeView.vue'),
        meta: {
            display: 'headers.home',
            display_title: 'menus.home',
        },
    },
    {
        path: 'parametrizacao',
        name: 'dashboard-parametrizacao',
        component: () =>
            import('@/views/parametrizacao/HomeView.vue'),
        meta: {
            display: 'headers.home',
            display_title: 'menus.home',
        },
    },
    {
        path: 'extraudinario',
        component: {
            render(c) {
                return c('router-view');
            },
        },
        children: [{
            path: '/',
            name: 'dashboard-extraudinario',
            component: () =>
                import('@/views/extraudinario/HomeView.vue'),

            meta: {
                display: 'headers.home',
                display_title: 'menus.home',
            }
        },
        {
            path: 'answers',
            name: 'answers',
            component: () =>
                import('@/views/extraudinario/ee-answers.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'calendar',
            name: 'calendar',
            component: () =>
                import('@/views/extraudinario/ee-calendar.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'center',
            name: 'center',
            component: () =>
                import('@/views/extraudinario/ee-center.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'classroom',
            name: 'classroom',
            component: () =>
                import('@/views/extraudinario/ee-classroom.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'dashboard',
            name: 'dashboard',
            component: () =>
                import('@/views/extraudinario/ee-dashboard.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'decoder',
            name: 'decoder',
            component: () =>
                import('@/views/extraudinario/ee-decoder.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'distribution',
            name: 'distribution',
            component: () =>
                import('@/views/extraudinario/ee-distribution.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'guideline',
            name: 'guideline',
            component: () =>
                import('@/views/extraudinario/ee-guideline.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'inscription',
            name: 'inscription',
            component: () =>
                import('@/views/extraudinario/ee-inscription.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'inscription-edit',
            name: 'inscription-edit',
            component: () =>
                import('@/views/extraudinario/ee-inscription-edit.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'inscription-online',
            name: 'inscription-online',
            component: () =>
                import('@/views/extraudinario/ee-inscription-online.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'inscription-validation',
            name: 'inscription-validation',
            component: () =>
                import('@/views/extraudinario/ee-inscription-validation.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'jury',
            name: 'jury',
            component: () =>
                import('@/views/extraudinario/ee-jury.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'list',
            name: 'list',
            component: () =>
                import('@/views/extraudinario/ee-list.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'list2',
            name: 'list2',
            component: () =>
                import('@/views/extraudinario/ee-list2.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'presences',
            name: 'presences',
            component: () =>
                import('@/views/extraudinario/ee-presences.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'report-inscription',
            name: 'report-inscription',
            component: () =>
                import('@/views/extraudinario/ee-report-inscription.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'report-inscription-subject',
            name: 'report-inscription-subject',
            component: () =>
                import('@/views/extraudinario/ee-report-inscription-subject.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        },
        {
            path: 'schedule',
            name: 'schedule',
            component: () =>
                import('@/views/extraudinario/ee-schedule.vue'),
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'headers.registar_aluno',
            }
        }
        ]
    },
    //Academico
    {
        path: 'academico',
        component: {
            render(c) {
                return c('router-view');
            },
        },
        children: [{
            path: '/',
            name: 'dashboard-academico',
            component: () =>
                import('@/views/academico/HomeView.vue'),

            meta: {
                display: 'headers.home',
                display_title: 'menus.home',
            }
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        },
        {
            path: 'registar-alunos',
            name: 'academico-registar-aluno',
            component: () =>
                import('@/views/academico/aluno/AddStudent.vue'),
    
            meta: {
                display: 'headers.registar_aluno',
                display_title: 'menus.registar_aluno',
            },
        }
        ]
    }
    //Fim de Academico
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
            import('@/views/12classe/12a-dashboard.vue'),

        meta: {
            display: 'headers.home',
            display_title: 'menus.home',
        },
    },
    {
        path: '12a-aswer',
        name: '12a-aswer',
        component: () =>
            import('@/views/12classe/12a-aswer.vue'),

        meta: {
            display: 'headers.home',
            display_title: 'menus.home',
        },
    },
    {
        path: '12a-calendar',
        name: '12a-calendar',
        component: () =>
            import('@/views/12classe/12a-calendar.vue'),

        meta: {
            display: 'headers.12a_calendar',
            display_title: 'menus.12a_calendar',
        },
    },
    {
        path: '12a-classroom',
        name: '12a-classroom',
        component: () =>
            import('@/views/12classe/12a-classroom.vue'),

        meta: {
            display: 'headers.12a-classroom',
            display_title: 'menus.12a-classroom',
        },
    },
    {
        path: '12a-jury',
        name: '12a-jury',
        component: () =>
            import('@/views/12classe/12a-jury.vue'),

        meta: {
            display: 'headers.12a-jury',
            display_title: 'menus.12a-jury',
        },
    },
    {
        path: '12a-list',
        name: '12a-list',
        component: () =>
            import('@/views/12classe/12a-list.vue'),

        meta: {
            display: 'headers.12a-list',
            display_title: 'menus.12a-list',
        },
    },
    {
        path: '12a-decoder',
        name: '12a-decoder',
        component: () =>
            import('@/views/12classe/12a-decoder.vue'),

        meta: {
            display: 'headers.12a-decoder',
            display_title: 'menus.12a-decoder',
        },
    },
    {
        path: '12a-guideline',
        name: '12a-guideline',
        component: () =>
            import('@/views/12classe/12a-guideline.vue'),

        meta: {
            display: 'headers.12a-guideline',
            display_title: 'menus.12a-guideline',
        },
    },
    {
        path: '12a-presences',
        name: '12a-presences',
        component: () =>
            import('@/views/12classe/12a-presences.vue'),

        meta: {
            display: 'headers.12a-presences',
            display_title: 'menus.12a-presences',
        },
    },
    ],
},
{
    path: '/user',
    component: {
        render(c) {
            return c('router-view');
        },
    },
    children: [{
        path: 'perfil',
        name: 'user-perfil',
        component: () =>
            import('@/views/user/UserPerfil.vue'),

        meta: {
            display: 'headers.user-perfil',
            display_title: 'menus.user-perfil',
        },
    },],
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
