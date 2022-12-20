import Vue from 'vue';
import Router from 'vue-router';
import Home from '@/views/HomeView.vue';
import i18n from '@/i18n';
import store from '@/store';

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
                path: 'ifp-answers',
                name: 'ifp-answers',
                component: () =>
                    import ('@/views/ifp/ifp-answers.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-calendar',
                name: 'ifp-calendar',
                component: () =>
                    import ('@/views/ifp/ifp-calendar.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-center',
                name: 'ifp-center',
                component: () =>
                    import ('@/views/ifp/ifp-center.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-classroom',
                name: 'ifp-classroom',
                component: () =>
                    import ('@/views/ifp/ifp-classroom.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-dashboard',
                name: 'ifp-dashboard',
                component: () =>
                    import ('@/views/ifp/ifp-dashboard.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-decoder',
                name: 'ifp-decoder',
                component: () =>
                    import ('@/views/ifp/ifp-decoder.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-guideline',
                name: 'ifp-guideline',
                component: () =>
                    import ('@/views/ifp/ifp-guideline.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-inscription-online',
                name: 'ifp-inscription-online',
                component: () =>
                    import ('@/views/ifp/ifp-inscription-online.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-inscription-validate',
                name: 'ifp-inscription-validate',
                component: () =>
                    import ('@/views/ifp/ifp-inscription-validate.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-inscription',
                name: 'ifp-inscription',
                component: () =>
                    import ('@/views/ifp/ifp-inscription.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-listcandidates',
                name: 'ifp-listcandidates',
                component: () =>
                    import ('@/views/ifp/ifp-listcandidates.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-jury-distribution',
                name: 'ifp-jury-distribution',
                component: () =>
                    import ('@/views/ifp/ifp-jury-distribution.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-jury',
                name: 'ifp-jury',
                component: () =>
                    import ('@/views/ifp/ifp-jury.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-list-2',
                name: 'ifp-list-2',
                component: () =>
                    import ('@/views/ifp/ifp-list-2.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-list',
                name: 'ifp-list',
                component: () =>
                    import ('@/views/ifp/ifp-list.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-presences',
                name: 'ifp-presences',
                component: () =>
                    import ('@/views/ifp/ifp-presences.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-schedule',
                name: 'ifp-schedule',
                component: () =>
                    import ('@/views/ifp/ifp-schedule.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-draw-exam',
                name: 'ifp-draw-exam',
                component: () =>
                    import ('@/views/ifp/ifp-draw-exam.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'ifp-upload-desenho',
                name: 'ifp-upload-desenho',
                component: () =>
                    import ('@/views/ifp/ifp-upload-desenho.vue'),
                meta: {
                    display: 'headers.home',
                    display_title: 'menus.home',
                },
            },
            {
                path: 'acessos',
                component: {
                    render(c) {
                        return c('router-view');
                    },
                },
                children: [{
                        path: '',
                        name: 'dashboard-acessos',
                        component: () =>
                            import ('@/views/acessos/HomeView.vue'),
                        meta: {
                            display: 'headers.home',
                            display_title: 'menus.home',
                        },
                    },
                    {
                        path: 'users',
                        name: 'users',
                        component: () =>
                            import ('@/views/acessos/user-add.vue'),
                        meta: {
                            display: 'headers.home',
                            display_title: 'menus.users',
                        },
                    },
                    {
                        path: 'user-permissions',
                        name: 'user-permissions',
                        component: () =>
                            import ('@/views/acessos/user-permissions.vue'),
                        meta: {
                            display: 'headers.home',
                            display_title: 'menus.permissions',
                        },
                    },
                    {
                        path: 'user-logs',
                        name: 'user-logs',
                        component: () =>
                            import ('@/views/acessos/user-logs.vue'),
                        meta: {
                            display: 'headers.home',
                            display_title: 'menus.logs',
                        },
                    },
                    {
                        path: 'user-conected',
                        name: 'user-conected',
                        component: () =>
                            import ('@/views/acessos/user-conected.vue'),
                        meta: {
                            display: 'headers.home',
                            display_title: 'menus.conected',
                        },
                    },
                ],
            },
            {
                path: 'config',
                component: {
                    render(c) {
                        return c('router-view');
                    },
                },
                children: [{
                        path: '',
                        name: 'dashboard-parametrizacao',
                        component: () =>
                            import ('@/views/parametrizacao/HomeView.vue'),
                        meta: {
                            display: 'headers.home',
                            display_title: 'menus.home',
                        },
                    },
                    {
                        path: 'school',
                        name: 'config_schools',
                        component: () =>
                            import ('@/views/parametrizacao/School.vue'),
                        meta: {
                            display: 'headers.schools',
                            display_title: 'menus.schools',
                        },
                    },
                    {
                        path: 'classes',
                        name: 'config_classes',
                        component: () =>
                            import ('@/views/parametrizacao/Classes.vue'),
                        meta: {
                            display: 'headers.classes',
                            display_title: 'menus.classes',
                        },
                    },
                    {
                        path: 'subject',
                        name: 'config_subjects',
                        component: () =>
                            import ('@/views/parametrizacao/Subject.vue'),
                        meta: {
                            display: 'headers.subjects',
                            display_title: 'menus.subjects',
                        },
                    },
                    {
                        path: 'classes-school',
                        name: 'config_classes_school',
                        component: () =>
                            import ('@/views/parametrizacao/SchoolClasses.vue'),
                        meta: {
                            display: 'headers.classes_school',
                            display_title: 'menus.classes_school',
                        },
                    },
                    {
                        path: 'classes-subjects',
                        name: 'config_classes_subjects',
                        component: () =>
                            import ('@/views/parametrizacao/SchoolClasses.vue'),
                        meta: {
                            display: 'headers.classes_subject',
                            display_title: 'menus.classes_subject',
                        },
                    },
                    {
                        path: 'curricular-plan',
                        name: 'config_curricular_plan',
                        component: () =>
                            import ('@/views/parametrizacao/SchoolClasses.vue'),
                        meta: {
                            display: 'headers.curricular_plan',
                            display_title: 'menus.curricular_plan',
                        },
                    },
                    {
                        path: 'nacionalidades',
                        name: 'config_nacionalidades',
                        component: () =>
                            import ('@/views/parametrizacao/SchoolClasses.vue'),
                        meta: {
                            display: 'headers.nacionalidades',
                            display_title: 'menus.nacionalidades',
                        },
                    },
                    {
                        path: 'categoria-ensino',
                        name: 'config_categoria_ensino',
                        component: () =>
                            import ('@/views/parametrizacao/Category.vue'),
                        meta: {
                            display: 'headers.categoria_ensino',
                            display_title: 'menus.categoria_ensino',
                        },
                    },
                    {
                        path: 'taxa-exame',
                        name: 'config_taxa_exame',
                        component: () =>
                            import ('@/views/parametrizacao/SchoolClasses.vue'),
                        meta: {
                            display: 'headers.taxa_exame',
                            display_title: 'menus.taxa_exame',
                        },
                    },
                ],
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
                            import ('@/views/extraudinario/HomeView.vue'),

                        meta: {
                            display: 'headers.home',
                            display_title: 'menus.home',
                        },
                    },
                    {
                        path: 'answers',
                        name: 'answers',
                        component: () =>
                            import ('@/views/extraudinario/ee-answers.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'calendar',
                        name: 'calendar',
                        component: () =>
                            import ('@/views/extraudinario/ee-calendar.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'center',
                        name: 'center',
                        component: () =>
                            import ('@/views/extraudinario/ee-center.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'classroom',
                        name: 'classroom',
                        component: () =>
                            import ('@/views/extraudinario/ee-classroom.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'dashboard',
                        name: 'dashboard',
                        component: () =>
                            import ('@/views/extraudinario/ee-dashboard.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'decoder',
                        name: 'decoder',
                        component: () =>
                            import ('@/views/extraudinario/ee-decoder.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'distribution',
                        name: 'distribution',
                        component: () =>
                            import ('@/views/extraudinario/ee-distribution.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'guideline',
                        name: 'guideline',
                        component: () =>
                            import ('@/views/extraudinario/ee-guideline.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'inscription',
                        name: 'inscription',
                        component: () =>
                            import ('@/views/extraudinario/ee-inscription.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'inscription-edit',
                        name: 'inscription-edit',
                        component: () =>
                            import ('@/views/extraudinario/ee-inscription-edit.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'inscription-online',
                        name: 'inscription-online',
                        component: () =>
                            import ('@/views/extraudinario/ee-inscription-online.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'inscription-validation',
                        name: 'inscription-validation',
                        component: () =>
                            import ('@/views/extraudinario/ee-inscription-validation.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'jury',
                        name: 'jury',
                        component: () =>
                            import ('@/views/extraudinario/ee-jury.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'list',
                        name: 'list',
                        component: () =>
                            import ('@/views/extraudinario/ee-list.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'list2',
                        name: 'list2',
                        component: () =>
                            import ('@/views/extraudinario/ee-list2.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'presences',
                        name: 'presences',
                        component: () =>
                            import ('@/views/extraudinario/ee-presences.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'report-inscription',
                        name: 'report-inscription',
                        component: () =>
                            import ('@/views/extraudinario/ee-report-inscription.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'report-inscription-subject',
                        name: 'report-inscription-subject',
                        component: () =>
                            import ('@/views/extraudinario/ee-report-inscription-subject.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                    {
                        path: 'schedule',
                        name: 'schedule',
                        component: () =>
                            import ('@/views/extraudinario/ee-schedule.vue'),
                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'headers.registar_aluno',
                        },
                    },
                ],
            },
            /*Rotas Do Modulo Gestao De Informacao Academica Escolar */
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
                            import ('@/views/academico/HomeView.vue'),

                        meta: {
                            display: 'headers.home',
                            display_title: 'menus.home',
                        },
                    },
                    /*Rota Do Sub-Menu Gestao Escolar*/
                    {
                        path: 'student-management',
                        name: 'student_management',
                        component: () =>
                            import ('@/views/academico/StudentManagement.vue'),

                        meta: {
                            display: 'headers.student_management',
                            display_title: 'menus.student_management',
                        },
                    },
                    {
                        path: 'addstudent',
                        name: 'addstudent',
                        component: () =>
                            import ('@/views/academico/aluno/AddStudent.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'student-import',
                        name: 'student-import',
                        component: () =>
                            import ('@/views/academico/aluno/student-import.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'student-transfer-to-school',
                        name: 'student-transfer-to-school',
                        component: () =>
                            import ('@/views/academico/aluno/student-transfer-to-school.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'student-transfer-to-class',
                        name: 'student-transfer-to-class',
                        component: () =>
                            import ('@/views/academico/aluno/student-transfer-to-class.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    /*Fim Das Rotas Do Sub-Menu Gestao Escolar*/

                    /*Definicao De Rotas Do Sub-Menu Matriculas*/
                    {
                        path: 'student-register',
                        name: 'student-register',
                        component: () =>
                            import ('@/views/academico/aluno/student-register.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'class-distribution',
                        name: 'class-distribution',
                        component: () =>
                            import ('@/views/academico/aluno/class-distribution.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'inscriptions-online',
                        name: 'inscriptions-online',
                        component: () =>
                            import ('@/views/academico/aluno/inscriptions-online.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'student-inscriptions',
                        name: 'student-inscriptions',
                        component: () =>
                            import ('@/views/academico/aluno/student-inscriptions.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    /*Fim Das Rotas Do Su-Menu Matriculas*/

                    /*Rotas Do Sumario*/
                    {
                        path: 'summary',
                        name: 'summary',
                        component: () =>
                            import ('@/views/academico/aluno/thematic.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'thematic',
                        name: 'thematic',
                        component: () =>
                            import ('@/views/academico/aluno/summary.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    /*Fim Das Rotas Do Sumario*/

                    /*Rotas Do Plano De Aula*/
                    {
                        path: 'summaries',
                        name: 'summaries',
                        component: () =>
                            import ('@/views/academico/aluno/summaries.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'define-plano',
                        name: 'define-plano',
                        component: () =>
                            import ('@/views/academico/aluno/define-plano.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    /*Fim Das Rotas Do Plano De Aula*/
                    /*Rotas Do Calendario*/
                    {
                        path: 'horarios',
                        name: 'horarios',
                        component: () =>
                            import ('@/views/academico/aluno/horarios.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'avaliacoes',
                        name: 'avaliacoes',
                        component: () =>
                            import ('@/views/academico/aluno/avaliacoes.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'exames',
                        name: 'exames',
                        component: () =>
                            import ('@/views/academico/aluno/exames.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'juris-exames',
                        name: 'juris-exames',
                        component: () =>
                            import ('@/views/academico/aluno/juris-exames.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    {
                        path: 'folhas-de-resposta',
                        name: 'folhas-de-resposta',
                        component: () =>
                            import ('@/views/academico/aluno/folhas-de-resposta.vue'),

                        meta: {
                            display: 'headers.registar_aluno',
                            display_title: 'menus.registar_aluno',
                        },
                    },
                    /*Fim Das Rotas Do Calendario*/
                ],
            },
            /*Fim das Rotas Do Modulo De Gestao De Informacao Academica Escolar*/
        ],
    },
    {
        path: '/12classe',
        component: {
            render(c) {
                return c('router-view');
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
                import ('@/views/user/UserPerfil.vue'),

            meta: {
                display: 'headers.user-perfil',
                display_title: 'menus.user-perfil',
            },
        }, ],
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
/*
router.beforeEach((to, from, next) => {
    //const token = localStorage.getItem('token');
    if (store.getters.isLoggedIn && to.name != 'login') {
        next();

        return;
    } else {
        next({ name: 'login' });
        return;
    }
});
 */

/* 
router.beforeEach((to, from, next) => {
    const token = localStorage.getItem('token');
    
    if (!token) next({ name: 'login' });
    else next();

    if (to.path === 'login' && auth.currentUser) {
        next('/');
        return;
    }

    if (
        to.matched.some((record) => record.meta.requiresAuth) &&
        !auth.currentUser
    ) {
        next('/login');
        return;
    }

    next();
});
 */

export default router;