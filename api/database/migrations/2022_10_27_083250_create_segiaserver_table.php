<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateSegiaserverTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('acta', function (Blueprint $table) {
            $table->integer('acta_id', true);
            $table->dateTime('acta_data')->nullable();
            $table->longText('acta_descricao')->nullable();
            $table->string('acta_referencia')->nullable();
            $table->integer('convocatoria_conv_id')->nullable()->index('FK_jdk8fs8ddg0l1audjacebf9ni');
            $table->integer('entidade_enti_id')->nullable()->index('FK_rdggjixm1br6m0q43qppai9ec');
            $table->integer('escola_esc_id')->nullable()->index('FK_ikxryj1skdd6myt9vg56s3l3p');
        });

        Schema::create('activo', function (Blueprint $table) {
            $table->integer('acti_id', true);
            $table->dateTime('acti_data')->nullable();
            $table->longText('acti_descricao')->nullable();
            $table->longText('acti_especificacoes')->nullable();
            $table->string('acti_referenciaDocumentoCompra')->nullable();
            $table->double('acti_valor');
            $table->integer('acti_vidaUtil');
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_rp47hp38awi1fpqoc4ebmp5qp');
            $table->integer('fornecedor_for_id')->nullable()->index('FK_c7i9rp55yxtixj2ofssn83vne');
        });

        Schema::create('adenda', function (Blueprint $table) {
            $table->integer('aden_id', true);
            $table->dateTime('aden_data')->nullable();
            $table->dateTime('aden_dataAprovacao')->nullable();
            $table->dateTime('aden_dataAprovacaoRegiao')->nullable();
            $table->dateTime('aden_dataAprovacaoSede')->nullable();
            $table->dateTime('aden_dataJustificativo')->nullable();
            $table->longText('aden_detalhes')->nullable();
            $table->string('aden_link')->nullable();
            $table->string('aden_referencia')->nullable();
            $table->string('aden_status')->nullable();
            $table->double('aden_valor');
            $table->boolean('encrypted');
            $table->integer('contrato_cont_id')->nullable()->index('FK_kanbae4v9j5ibqvb289ghlyh3');
            $table->integer('entidade_enti_id')->nullable()->index('FK_1dcxp4uiuydwbouseceykbg9i');
            $table->integer('usuario_usua_id')->nullable()->index('FK_m0wbiuqlirtddf0q9dkorb72');
            $table->integer('usuario2_usua_id')->nullable()->index('FK_fuf7gv7dx8a2qmym7cgcsvsuq');
            $table->integer('usuario3_usua_id')->nullable()->index('FK_752xlf1p4w319pbpnkrdn3yi1');
        });

        Schema::create('administracao', function (Blueprint $table) {
            $table->integer('adm_id', true);
            $table->string('adm_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('empresa_enti_id')->nullable()->index('FK_aew1eoj0u4en2ssyeipyc74g0');
        });

        Schema::create('agenda', function (Blueprint $table) {
            $table->integer('agen_id', true);
            $table->string('agen_diaSemana')->nullable();
            $table->string('agen_hora')->nullable();
            $table->string('agen_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_3gi8xqmtd9khgc1scftmi992q');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_ondexcxujgssi7jgwix1ttsi');
            $table->integer('entidade_enti_id')->nullable()->index('FK_7ysi2nb4tddwb49y2h2qtlwex');
            $table->integer('turma_turm_id')->nullable()->index('FK_2emmtpsc80b2xtsm4cs5qrh7v');
        });

        Schema::create('agendacontacto', function (Blueprint $table) {
            $table->integer('agc_id', true);
            $table->string('agc_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('cliente_clie_id')->nullable()->index('FK_20t05635ee2d1ao4et3olhg3m');
            $table->integer('entidade_enti_id')->nullable()->index('FK_dalbjoormil0teywq3qq9dqvk');
            $table->integer('fornecedor_for_id')->nullable()->index('FK_e4pp2pqoiae206duif7dwtkt3');
            $table->integer('funcionario_func_id')->nullable()->index('FK_58w7bp1psw78epuvw8s7kii18');
            $table->integer('tipoContacto_tipc_id')->nullable()->index('FK_o1pybgirwo21hn32lt6pyyi3j');
        });

        Schema::create('aluno', function (Blueprint $table) {
            $table->integer('alun_id', true);
            $table->string('alun_badgnumber')->nullable();
            $table->string('alun_bolseiro')->nullable();
            $table->string('alun_categoria')->nullable();
            $table->dateTime('alun_dataInscricao')->nullable();
            $table->dateTime('alun_dataProximoPagamento')->nullable();
            $table->boolean('alun_deficiente');
            $table->string('alun_distrito')->nullable();
            $table->string('alun_nivel')->nullable();
            $table->string('alun_password')->nullable();
            $table->string('alun_provincia')->nullable();
            $table->string('alun_status')->nullable();
            $table->integer('alun_turno');
            $table->string('alun_unico')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_kbjdu10dy3f1mmvnruhhnbmbi');
            $table->integer('escola_esc_id')->nullable()->index('FK_8lki430ac35iaf284bhyll6xj');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_ai5syhs7i5hit0uifd43a4qje');
            $table->integer('turma_turm_id')->nullable()->index('FK_7dkxvmvikn17q78r35w1odj7q');
        });

        Schema::create('anolectivo', function (Blueprint $table) {
            $table->integer('anol_id', true);
            $table->boolean('anol_corrente');
            $table->string('anol_descricao')->nullable();
            $table->string('anol_status')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_frxat7s9w6gnsrjfp5xy1av0b');
        });

        Schema::create('aproveitamento', function (Blueprint $table) {
            $table->integer('apro_id', true);
            $table->integer('apro_admitidos');
            $table->string('apro_ano')->nullable();
            $table->string('apro_categoria')->nullable();
            $table->integer('apro_dispensados');
            $table->integer('apro_exames');
            $table->integer('apro_excluidos');
            $table->integer('apro_reprovados');
            $table->string('cod_escola')->nullable();
        });

        Schema::create('area', function (Blueprint $table) {
            $table->integer('area_id', true);
            $table->string('area_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_5y4xdnrg1vra75xtn1hc8s8cj');
        });

        Schema::create('areaformacao', function (Blueprint $table) {
            $table->integer('aref_id', true);
            $table->string('aref_descricao')->nullable();
            $table->longText('aref_detalhes')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_4w1f237uce4cil3kbi8851nvx');
        });

        Schema::create('assiduidade', function (Blueprint $table) {
            $table->integer('assi_id', true);
            $table->dateTime('assi_data')->nullable();
            $table->string('assi_horaEntrada')->nullable();
            $table->string('assi_horaSaida')->nullable();
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_taej257uv67ps6ht9rdou3s45');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_knqx8leyqvxp3an5btor1s5sw');
        });

        Schema::create('avaliacao', function (Blueprint $table) {
            $table->integer('aval_id', true);
            $table->integer('aval_anoLectivo');
            $table->string('aval_comportamento')->nullable();
            $table->string('aval_observacoes')->nullable();
            $table->string('aval_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('aluno_alun_id')->nullable()->index('FK_avqgkwb66f9siw8injhgo9nhl');
            $table->integer('entidade_enti_id')->nullable()->index('FK_mcyawqa1dsvq17stmpkitaet4');
        });

        Schema::create('banco', function (Blueprint $table) {
            $table->integer('bnc_id', true);
            $table->string('bnc_conta')->nullable();
            $table->string('bnc_logo')->nullable();
            $table->string('bnc_moeda')->nullable();
            $table->string('bnc_nib')->nullable();
            $table->string('bnc_nome')->nullable();
            $table->double('bnc_saldo');
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_47jyd7i2oqfr8g2w6320q8ujh');
        });

        Schema::create('boletim', function (Blueprint $table) {
            $table->integer('bole_id', true);
            $table->longText('bole_descricao')->nullable();
            $table->string('bole_periodo')->nullable();
            $table->string('bole_status')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_86y8cp7luvxmoq2mnrfqw7ivf');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_om82qwj8rf5r3grbk5so4yxd8');
        });

        Schema::create('browser', function (Blueprint $table) {
            $table->integer('bro_id', true);
            $table->dateTime('bro_data')->nullable();
            $table->string('bro_descricao')->nullable();
            $table->string('bro_lembre')->nullable();
            $table->integer('usuario_usua_id')->nullable()->index('FK_nf9r0bemspgneg8ixbm91f98r');
        });

        Schema::create('caixa', function (Blueprint $table) {
            $table->integer('caix_id', true);
            $table->string('caix_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('departamento_dep_id')->nullable()->index('FK_2mu894nt40t16ldsyngkbgdiq');
            $table->integer('entidade_enti_id')->nullable()->index('FK_nltlbgf39bw31uim62xof7xom');
            $table->integer('usuario_usua_id')->nullable()->index('FK_84bo5166rmesb0lo963phjpq5');
        });

        Schema::create('calendario', function (Blueprint $table) {
            $table->integer('cale_id', true);
            $table->dateTime('cale_acp')->nullable();
            $table->dateTime('cale_acp2')->nullable();
            $table->dateTime('cale_acp2Limite')->nullable();
            $table->dateTime('cale_acpLimite')->nullable();
            $table->dateTime('cale_exame')->nullable();
            $table->dateTime('cale_exameLimite')->nullable();
            $table->boolean('cale_haveAcp');
            $table->boolean('cale_haveExame');
            $table->boolean('cale_haveTeste3');
            $table->boolean('cale_haveTeste4');
            $table->dateTime('cale_recorrencia')->nullable();
            $table->dateTime('cale_recorrenciaLimite')->nullable();
            $table->string('cale_semestre')->nullable();
            $table->dateTime('cale_teste1')->nullable();
            $table->dateTime('cale_teste1Limite')->nullable();
            $table->dateTime('cale_teste2')->nullable();
            $table->dateTime('cale_teste2Limite')->nullable();
            $table->dateTime('cale_teste3')->nullable();
            $table->dateTime('cale_teste3Limite')->nullable();
            $table->dateTime('cale_teste4')->nullable();
            $table->dateTime('cale_teste4Limite')->nullable();
            $table->boolean('encrypted');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_32uujplvdhlrg5oa979oq5vdu');
            $table->integer('curso_curs_id')->nullable()->index('FK_ry23c7th8hjprj2ef7k0w52qv');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_98mxa2b9760hj8sv2187uahnh');
            $table->integer('docente_doce_id')->nullable()->index('FK_5g188ca99e6q7hhbpjikw6tta');
            $table->integer('entidade_enti_id')->nullable()->index('FK_9fgbiary8onfif286f2ykm8lg');
            $table->integer('juri1_doce_id')->nullable()->index('FK_gccsrxn9qkuasrga6x1v4obmr');
            $table->integer('juri2_doce_id')->nullable()->index('FK_7746ft7hog9q6i39bh1m3ffvc');
            $table->integer('juri3_doce_id')->nullable()->index('FK_mwds2x932u8pnkos7j8veq0oo');
            $table->integer('juri4_doce_id')->nullable()->index('FK_e6po33lyxud6bv0671pmpxejw');
            $table->integer('turma_turm_id')->nullable()->index('FK_74odnvyv7w55sfw52tffsoqlw');
        });

        Schema::create('calendarioexame', function (Blueprint $table) {
            $table->integer('calee_id', true);
            $table->dateTime('calee_exame')->nullable();
            $table->dateTime('calee_exameLimite')->nullable();
            $table->dateTime('calee_recorrencia')->nullable();
            $table->dateTime('calee_recorrenciaLimite')->nullable();
            $table->string('calee_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_rvd5vqdpebu392hsuw6bmismo');
            $table->integer('curso_curs_id')->nullable()->index('FK_ucqb3a5culx0xu4gbmv07eta');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_wuumfdmtmy08penr2x2gsvnf');
            $table->integer('entidade_enti_id')->nullable()->index('FK_3x7p6epyknjn2jfceuqjcgvi7');
        });

        Schema::create('cargo', function (Blueprint $table) {
            $table->integer('car_id', true);
            $table->string('car_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_om59n1p8simtxunk78xsc7v65');
        });

        Schema::create('categoria', function (Blueprint $table) {
            $table->integer('cate_id', true);
            $table->longText('cate_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_i3x8qikv8e5w53bslwwe5app5');
        });

        Schema::create('categoriaproduto', function (Blueprint $table) {
            $table->integer('catp_id', true);
            $table->string('catp_codigo')->nullable();
            $table->string('catp_descricao')->nullable();
            $table->boolean('catp_estocado');
            $table->integer('catp_numeroArtigos');
            $table->integer('catp_referenciaArtigos');
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_56q3cja2toqw8xna7maeddhox');
        });

        Schema::create('cidade', function (Blueprint $table) {
            $table->integer('cida_id', true);
            $table->string('cida_descricao')->nullable();
            $table->boolean('encrypted');
        });

        Schema::create('cliente', function (Blueprint $table) {
            $table->integer('clie_id', true);
            $table->string('clie_categoria')->nullable();
            $table->string('clie_contaGeral')->nullable();
            $table->string('clie_funcao')->nullable();
            $table->integer('clie_nid');
            $table->double('clie_saldoCredito');
            $table->double('clie_saldoDebito');
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_10brqolm3gt59gcakn2o146u0');
            $table->integer('pessoapess_pess_id')->nullable()->index('FK_3d8yf1m8qy81ovurrtetgubve');
        });

        Schema::create('codigo', function (Blueprint $table) {
            $table->integer('cod_id', true);
            $table->string('cod_codigo')->nullable();
            $table->string('cod_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_9jcxm9npbsq43k8s73ovjdb48');
        });

        Schema::create('condicaopagamento', function (Blueprint $table) {
            $table->integer('conp_id', true);
            $table->longText('conp_descricao')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_jd8q8vknvxr8bglmvepxv6j6d');
        });

        Schema::create('conta', function (Blueprint $table) {
            $table->integer('con_id', true);
            $table->bigInteger('con_codigo');
            $table->string('con_nome')->nullable();
            $table->double('con_saldo');
            $table->boolean('encrypted');
            $table->integer('cliente_clie_id')->nullable()->index('FK_nex8koc1uo9mlnrdfjcguwjw9');
            $table->integer('entidade_enti_id')->nullable()->index('FK_sjijacd720ikrpj8citoj25e5');
            $table->integer('tipoConta_tip_id')->nullable()->index('FK_asdv8b3rjfjtilsw5hftw7eoe');
        });

        Schema::create('contacorrente', function (Blueprint $table) {
            $table->integer('coco_id', true);
            $table->double('coco_credito');
            $table->dateTime('coco_data')->nullable();
            $table->double('coco_debito');
            $table->string('coco_documento')->nullable();
            $table->double('coco_saldo');
            $table->boolean('encrypted');
            $table->integer('cliente_clie_id')->nullable()->index('FK_14l1faakxfivcksjppmw695x4');
            $table->integer('entidade_enti_id')->nullable()->index('FK_pnihc8swojf73k4mvlu7bnsm4');
            $table->integer('usuario_usua_id')->nullable()->index('FK_70irf027dlsm901xfflndo8m1');
        });

        Schema::create('contageral', function (Blueprint $table) {
            $table->integer('ctg_id', true);
            $table->string('ctg_conta')->nullable();
            $table->string('ctg_descricao')->nullable();
            $table->boolean('ctg_raiz');
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_qf5yrej3obl5admbo3k1c50gu');
        });

        Schema::create('contracto', function (Blueprint $table) {
            $table->integer('cnt_id', true);
            $table->string('cnt_agencia')->nullable();
            $table->string('cnt_banco')->nullable();
            $table->string('cnt_beneficios')->nullable();
            $table->bigInteger('cnt_conta');
            $table->dateTime('cnt_dataadmissao')->nullable();
            $table->dateTime('cnt_datafim')->nullable();
            $table->dateTime('cnt_datainicio')->nullable();
            $table->string('cnt_graohierarquico')->nullable();
            $table->string('cnt_horassemanais')->nullable();
            $table->double('cnt_salario');
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_7one04jhrnowbxeji0ik25qo5');
            $table->integer('clienteclie_clie_id')->nullable()->index('FK_4lts1hkl27bjgyuc7wgpksd4v');
            $table->integer('funcionario_func_id')->nullable()->index('FK_2t6gxr1ohqqabxf71yc36rh3d');
            $table->integer('servicoserv_serv_id')->nullable()->index('FK_kmoo260fu7x7dxasdt7xw2s4s');
        });

        Schema::create('contrato', function (Blueprint $table) {
            $table->integer('cont_id', true);
            $table->dateTime('cont_data')->nullable();
            $table->dateTime('cont_dataConclusao')->nullable();
            $table->dateTime('cont_dataEntrega')->nullable();
            $table->dateTime('cont_dataVisto')->nullable();
            $table->longText('cont_descricao')->nullable();
            $table->longText('cont_empreteiro')->nullable();
            $table->double('cont_execucaoFinanceira');
            $table->integer('cont_execucaoFisica');
            $table->longText('cont_fonteFinacimento')->nullable();
            $table->string('cont_gestor')->nullable();
            $table->longText('cont_link')->nullable();
            $table->longText('cont_linkVisto')->nullable();
            $table->longText('cont_observacoes')->nullable();
            $table->string('cont_referencia')->nullable();
            $table->string('cont_referencia_2')->nullable();
            $table->string('cont_tipoVisto')->nullable();
            $table->double('cont_valor');
            $table->double('cont_valorExecutar');
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_ai16kqg1fsg5a9lx2hjtm132u');
        });

        Schema::create('convocado', function (Blueprint $table) {
            $table->integer('convo_id', true);
            $table->integer('convocatoria_conv_id')->nullable()->index('FK_svbwen9x84a0an3kwvqbouh5a');
            $table->integer('entidade_enti_id')->nullable()->index('FK_8xcrfflv1v2wfcm07rx97dkv7');
            $table->integer('escola_esc_id')->nullable()->index('FK_ajfqe71ni8lnju81afalc31t0');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_dtqf2v1wb9pyu7k811xvf0ufg');
        });

        Schema::create('convocatoria', function (Blueprint $table) {
            $table->integer('conv_id', true);
            $table->longText('conv_1')->nullable();
            $table->longText('conv_10')->nullable();
            $table->longText('conv_2')->nullable();
            $table->longText('conv_3')->nullable();
            $table->longText('conv_4')->nullable();
            $table->longText('conv_5')->nullable();
            $table->longText('conv_6')->nullable();
            $table->longText('conv_7')->nullable();
            $table->longText('conv_8')->nullable();
            $table->longText('conv_9')->nullable();
            $table->boolean('conv_acta');
            $table->dateTime('conv_data')->nullable();
            $table->dateTime('conv_dataReuniao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_gkdc0jlmd4xm2xgp62eivb0rb');
            $table->integer('escola_esc_id')->nullable()->index('FK_apoof1bkue143pkqin5kwwx4y');
            $table->integer('presidente_pess_id')->nullable()->index('FK_e0xt4d8ncvmnwlychpy9ly9tw');
            $table->integer('sala_sala_id')->nullable()->index('FK_hh963dw5wk8duqwvdx0r5h0t0');
            $table->integer('secretario_pess_id')->nullable()->index('FK_t3hiysasu59vo0q8dkbxwqtji');
        });

        Schema::create('cor', function (Blueprint $table) {
            $table->integer('cor_id', true);
            $table->string('cor_codigo')->nullable();
            $table->string('cor_codigoHexaDecimal')->nullable();
            $table->string('cor_nome')->nullable();
            $table->boolean('encrypted');
        });

        Schema::create('curso', function (Blueprint $table) {
            $table->integer('curs_id', true);
            $table->integer('curs_aprovacoes');
            $table->string('curs_cod')->nullable();
            $table->double('curs_custoInscricao');
            $table->string('curs_descricao')->nullable();
            $table->integer('curs_duracao');
            $table->boolean('curs_exame');
            $table->integer('curs_inscritos');
            $table->integer('curs_numPrestacoes');
            $table->integer('curs_numTurmas');
            $table->double('curs_preco');
            $table->integer('curs_reprovacoes');
            $table->string('curs_tipo')->nullable();
            $table->boolean('encrypted');
            $table->integer('areaFormacao_aref_id')->nullable()->index('FK_bkd5vu4xxqy225d2o6xnlgq8a');
            $table->integer('entidade_enti_id')->nullable()->index('FK_5oh9yrcu7v3hvcwfbs14acxrg');
        });

        Schema::create('departamento', function (Blueprint $table) {
            $table->integer('dep_id', true);
            $table->string('dep_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_a756kbm4bsk6qrt6xhapj7l30');
            $table->integer('administracao_adm_id')->nullable()->index('FK_eejspavkwhwuak1pq2uu3nssi');
            $table->integer('nivelPrioridade_nvp_id')->nullable()->index('FK_ntecai3lm5d1sa3ayu7ti3yo6');
        });

        Schema::create('dependente', function (Blueprint $table) {
            $table->integer('dpn_id', true);
            $table->string('dpn_grau')->nullable();
            $table->string('dpn_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_24wnkht2g6i5k24m07kxyd2ug');
            $table->integer('funcionario_func_id')->nullable()->index('FK_7qbhfckctc3jpv2acc94d8eco');
        });

        Schema::create('despesa', function (Blueprint $table) {
            $table->integer('desp_id', true);
            $table->boolean('desp_aCredito');
            $table->dateTime('desp_data')->nullable();
            $table->string('desp_descricao')->nullable();
            $table->string('desp_fornecedor')->nullable();
            $table->bigInteger('desp_nrDocumento');
            $table->bigInteger('desp_nuit');
            $table->integer('desp_numeroRequisicoes');
            $table->string('desp_referencia')->nullable();
            $table->string('desp_status')->nullable();
            $table->double('desp_valor');
            $table->double('desp_valorExecutado');
            $table->double('desp_valorPago');
            $table->boolean('encrypted');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_ix6fw0l8nm6vwwdxgs9s12wi1');
            $table->integer('tipoDespesa_tipd_id')->nullable()->index('FK_ob59rwsh7ee50cnugp7xckkri');
            $table->integer('usuario_usua_id')->nullable()->index('FK_jhsaoifwu41688cg6seyh6ybr');
        });

        Schema::create('diario', function (Blueprint $table) {
            $table->integer('dir_id', true);
            $table->string('dir_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_johda3lae471pitwiv31dewhg');
        });

        Schema::create('diasemana', function (Blueprint $table) {
            $table->integer('dias_id', true);
            $table->string('dias_descricao')->nullable();
            $table->boolean('encrypted');
        });

        Schema::create('disciplina', function (Blueprint $table) {
            $table->integer('disc_id', true);
            $table->integer('disc_cargaHoraria');
            $table->string('disc_codigo')->nullable();
            $table->string('disc_descricao')->nullable();
            $table->string('disc_grupo')->nullable();
            $table->string('disc_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_grsg69oau24l68e1anxnohfow');
        });

        Schema::create('disciplinacurso', function (Blueprint $table) {
            $table->integer('disd_id', true);
            $table->string('disd_semestre')->nullable();
            $table->boolean('encrypted');
            $table->integer('curso_curs_id')->nullable()->index('FK_6kwg61ee7c432fakqmn6mjmw0');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_m28yaqqphd17gldaxbdhx0s6o');
            $table->integer('entidade_enti_id')->nullable()->index('FK_qihsrlaipmg9xxtkwssw8m6bk');
        });

        Schema::create('disciplinadocente', function (Blueprint $table) {
            $table->integer('disd_id', true);
            $table->integer('disciplina_disc_id')->nullable()->index('FK_kg4evqx1x2qw882martam55or');
            $table->integer('docente_doce_id')->nullable()->index('FK_a3myhb0nm58vso67pghet6h1');
            $table->integer('entidade_enti_id')->nullable()->index('FK_4hio7nrflk1nhjkrjanf6ncvv');
        });

        Schema::create('doc', function (Blueprint $table) {
            $table->integer('doc_id', true);
            $table->longText('doc_assunto')->nullable();
            $table->dateTime('doc_data')->nullable();
            $table->dateTime('doc_dataDespacho')->nullable();
            $table->dateTime('doc_dataParecer')->nullable();
            $table->longText('doc_despacho')->nullable();
            $table->string('doc_destinatario')->nullable();
            $table->longText('doc_link')->nullable();
            $table->longText('doc_parecer')->nullable();
            $table->string('doc_referencia')->nullable();
            $table->string('doc_status')->nullable();
            $table->longText('doc_texto')->nullable();
            $table->string('doc_tipo')->nullable();
            $table->boolean('encrypted');
            $table->integer('codigo_cod_id')->nullable()->index('FK_tjdx0op0bm45fprc5ay9jkyaa');
            $table->integer('departamento_dep_id')->nullable()->index('FK_4qtl42972kex8o60r6voski7k');
            $table->integer('entidade_enti_id')->nullable()->index('FK_dhlomryq5ayjbncd0miomx8dy');
            $table->integer('escola_esc_id')->nullable()->index('FK_ldeks5i11tw7bqgs0m2v95lw0');
            $table->integer('usuario_usua_id')->nullable()->index('FK_qr4ly0f28e1x76b7jjitigub2');
            $table->integer('usuario2_usua_id')->nullable()->index('FK_5o947e57pp40bdkpy1y3cdq08');
            $table->integer('usuario3_usua_id')->nullable()->index('FK_lho08pgudxfeu30j095lhmu71');
        });

        Schema::create('docente', function (Blueprint $table) {
            $table->integer('doce_id', true);
            $table->boolean('doce_activo');
            $table->string('doce_categoria')->nullable();
            $table->string('doce_especialidade')->nullable();
            $table->string('doce_grauFormacao')->nullable();
            $table->string('doce_provincia')->nullable();
            $table->string('doce_senha')->nullable();
            $table->string('doce_tipoContrato')->nullable();
            $table->string('doce_usuario')->nullable();
            $table->dateTime('doce_validadeContrato')->nullable();
            $table->boolean('encrypted');
            $table->integer('areaFormacao_aref_id')->nullable()->index('FK_ataa0n6q7saq8j56lf0toywre');
            $table->integer('entidade_enti_id')->nullable()->index('FK_43lkif5xlit28rml5m1tdgr5a');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_qn8muyudxkb50x3vpnebqkrwi');
        });

        Schema::create('docenteturma', function (Blueprint $table) {
            $table->integer('doct_id', true);
            $table->integer('docente_doce_id')->nullable()->index('FK_2lwqcfjywgpyj3wbhl1nsx6f0');
            $table->integer('entidade_enti_id')->nullable()->index('FK_q14kouux2noty67ph80ihj8r4');
            $table->integer('turma_turm_id')->nullable()->index('FK_l8u5pwbh9neqhp3ku2gftjheb');
        });

        Schema::create('documento', function (Blueprint $table) {
            $table->integer('doc_id', true);
            $table->string('doc_nome')->nullable();
            $table->boolean('encrypted');
            $table->integer('entidade_enti_id')->nullable()->index('FK_7nn20ephejebgdiqa7nefaggt');
        });

        Schema::create('entidade', function (Blueprint $table) {
            $table->integer('enti_id', true);
            $table->boolean('encrypted');
            $table->double('enti_capital');
            $table->string('enti_chaveSistema')->nullable();
            $table->string('enti_codigoPostal')->nullable();
            $table->string('enti_contactos1')->nullable();
            $table->string('enti_contactos2')->nullable();
            $table->string('enti_contactos3')->nullable();
            $table->dateTime('enti_dataFinalAssistencia')->nullable();
            $table->dateTime('enti_dataInicioAssitencia')->nullable();
            $table->string('enti_delegacao')->nullable();
            $table->string('enti_distrito')->nullable();
            $table->string('enti_dominio')->nullable();
            $table->string('enti_email')->nullable();
            $table->string('enti_endereco')->nullable();
            $table->string('enti_estadoSistema')->nullable();
            $table->string('enti_generoActividade')->nullable();
            $table->double('enti_iva');
            $table->string('enti_licenca')->nullable();
            $table->string('enti_linguaSistema')->nullable();
            $table->string('enti_logotipo')->nullable();
            $table->string('enti_macServidor')->nullable();
            $table->boolean('enti_newsletter');
            $table->string('enti_nome')->nullable();
            $table->string('enti_nuit')->nullable();
            $table->string('enti_pais')->nullable();
            $table->string('enti_pessoaContacto')->nullable();
            $table->string('enti_provincia')->nullable();
            $table->string('enti_sigla')->nullable();
        });

        Schema::create('escola', function (Blueprint $table) {
            $table->integer('esc_id', true);
            $table->string('cod_escola')->nullable();
            $table->integer('esc_alunos');
            $table->integer('esc_alunos_homens');
            $table->integer('esc_alunos_mulheres');
            $table->integer('esc_alunos_necessitados');
            $table->string('esc_contacto')->nullable();
            $table->string('esc_descricao')->nullable();
            $table->string('esc_distrito')->nullable();
            $table->integer('esc_docentes');
            $table->string('esc_endereco')->nullable();
            $table->integer('esc_faixa_05');
            $table->integer('esc_faixa_1115');
            $table->integer('esc_faixa_1625');
            $table->integer('esc_faixa_2635');
            $table->integer('esc_faixa_35');
            $table->integer('esc_faixa_610');
            $table->integer('esc_membros_homens');
            $table->integer('esc_membros_mulheres');
            $table->string('esc_provincia')->nullable();
            $table->integer('esc_salas');
            $table->double('esc_saldo');
            $table->integer('esc_turmas');
        });

        Schema::create('estadofactura', function (Blueprint $table) {
            $table->integer('estf_id', true);
            $table->boolean('encrypted');
            $table->string('estf_descricao')->nullable();
        });

        Schema::create('exame', function (Blueprint $table) {
            $table->integer('exam_id', true);
            $table->boolean('encrypted');
            $table->boolean('exam_extraodinario');
            $table->boolean('exam_fraude');
            $table->float('exam_media', 10, 0);
            $table->boolean('exam_naRecorrencia');
            $table->float('exam_nota', 10, 0);
            $table->float('exam_notaFinal', 10, 0);
            $table->boolean('exam_presenca');
            $table->float('exam_recorrencia', 10, 0);
            $table->string('exam_semestre')->nullable();
            $table->integer('aluno_alun_id')->nullable()->index('FK_7fp9b02gfuj5ihrpned1qdie5');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_ohlqhdvrnddsfac8yrvrj6k8h');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_6cn7ybgwypslpusof4jfmafr5');
            $table->integer('entidade_enti_id')->nullable()->index('FK_ao14u1oumwx3su9r6f3mg3tca');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_hypknfacmlg2muescafsxjx0y');
            $table->integer('salaExame_salae_id')->nullable()->index('FK_6yr3292ylfg9uues9k28edlrf');
        });

        Schema::create('extracto', function (Blueprint $table) {
            $table->integer('ext_id', true);
            $table->boolean('encrypted');
            $table->double('ext_credito');
            $table->date('ext_data')->nullable();
            $table->double('ext_debito');
            $table->string('ext_movimento')->nullable();
            $table->double('ext_saldo');
            $table->integer('entidade_enti_id')->nullable()->index('FK_ccf1yuw773xr9tltok1h48hf');
            $table->integer('factura_fact_id')->nullable()->index('FK_a4mmrye6vdk99babdgo11611r');
        });

        Schema::create('extractocontageral', function (Blueprint $table) {
            $table->integer('extc_id', true);
            $table->boolean('encrypted');
            $table->double('extc_credito');
            $table->date('extc_data')->nullable();
            $table->double('extc_debito');
            $table->longText('extc_movimento')->nullable();
            $table->string('extc_referencia')->nullable();
            $table->integer('contaGeral_ctg_id')->nullable()->index('FK_19gkfusc1nfoicys516judg7m');
            $table->integer('entidade_enti_id')->nullable()->index('FK_k4i70e28jhu9nia1xn6bjhc6j');
            $table->integer('lancamento_lan_id')->nullable()->index('FK_k358qt33e6loreuv1jnmnncib');
        });

        Schema::create('factura', function (Blueprint $table) {
            $table->integer('fact_id', true);
            $table->boolean('encrypted');
            $table->double('fact_ValorTrocos');
            $table->string('fact_bancoPagamento')->nullable();
            $table->double('fact_cambio');
            $table->string('fact_categorizacao')->nullable();
            $table->string('fact_condicaoPagamento')->nullable();
            $table->dateTime('fact_data')->nullable();
            $table->dateTime('fact_dataLimite')->nullable();
            $table->dateTime('fact_dataPagamento')->nullable();
            $table->double('fact_desconto');
            $table->double('fact_descontoFinaceiro');
            $table->string('fact_documentoPagamento')->nullable();
            $table->string('fact_documentoReferencia')->nullable();
            $table->boolean('fact_emitida');
            $table->boolean('fact_emitidoRecibo');
            $table->string('fact_item')->nullable();
            $table->boolean('fact_iva');
            $table->boolean('fact_lancada');
            $table->longText('fact_motivoIsencao')->nullable();
            $table->string('fact_nrDocumentoPagamento')->nullable();
            $table->bigInteger('fact_numerocartao');
            $table->bigInteger('fact_numerolancamento');
            $table->longText('fact_observacoes')->nullable();
            $table->string('fact_origem')->nullable();
            $table->integer('fact_pedidoCliente');
            $table->integer('fact_prestacoes');
            $table->integer('fact_prestacoesPagas');
            $table->boolean('fact_reciboProcessado');
            $table->string('fact_referencia')->nullable();
            $table->string('fact_referenciaRecibo')->nullable();
            $table->string('fact_requisicao')->nullable();
            $table->string('fact_status')->nullable();
            $table->string('fact_tipo')->nullable();
            $table->double('fact_valorIncidencia');
            $table->double('fact_valorMulta');
            $table->double('fact_valorPago');
            $table->double('fact_valorProcessado');
            $table->double('fact_valorRecibo');
            $table->double('fact_valorTotalMedio');
            $table->double('fact_valoriva');
            $table->double('fact_valortotal');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_l9cu83u86jv7swv2sayt2066h');
            $table->integer('caixa_caix_id')->nullable()->index('FK_btj7lhcqrg4kcqtq1nn9x0d6w');
            $table->integer('conta_ctg_id')->nullable()->index('FK_n9q1itic7w1m80i9fksj1f7ed');
            $table->integer('documento_doc_id')->nullable()->index('FK_3hvhu0mt8vrm460rsarcjgn9d');
            $table->integer('moeda_moe_id')->nullable()->index('FK_f2ubmtdurx6mjqagc9ibcab8d');
            $table->integer('pagamento_pag_id')->nullable()->index('FK_158uv0y880xxre18kwkayp4lp');
            $table->integer('usuario_usua_id')->nullable()->index('FK_a70gyxw3dru3i5yrb6k17e9xq');
            $table->integer('venda_vend_id')->nullable()->index('FK_h7f67f4gdqlmkc705e397fy8a');
        });

        Schema::create('falta', function (Blueprint $table) {
            $table->integer('falt_id', true);
            $table->string('cod_escola')->nullable();
            $table->integer('falt_01');
            $table->integer('falt_02');
            $table->integer('falt_03');
            $table->integer('falt_04');
            $table->integer('falt_05');
            $table->integer('falt_06');
            $table->integer('falt_07');
            $table->integer('falt_08');
            $table->integer('falt_09');
            $table->integer('falt_10');
            $table->integer('falt_11');
            $table->integer('falt_12');
            $table->string('falt_ano')->nullable();
            $table->integer('falt_j_01');
            $table->integer('falt_j_02');
            $table->integer('falt_j_03');
            $table->integer('falt_j_04');
            $table->integer('falt_j_05');
            $table->integer('falt_j_06');
            $table->integer('falt_j_07');
            $table->integer('falt_j_08');
            $table->integer('falt_j_09');
            $table->integer('falt_j_10');
            $table->integer('falt_j_11');
            $table->integer('falt_j_12');
        });

        Schema::create('faltas', function (Blueprint $table) {
            $table->integer('flt_id', true);
            $table->boolean('encrypted');
            $table->dateTime('flt_data')->nullable();
            $table->dateTime('flt_dataJustificacao')->nullable();
            $table->string('flt_descricao')->nullable();
            $table->string('flt_status')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_hqjkt4f6b6kuyihe43fh2ok4v');
            $table->integer('funcionario_func_id')->nullable()->index('FK_s4jc3autodujjf41a380ejil8');
        });

        Schema::create('fecho', function (Blueprint $table) {
            $table->integer('fech_id', true);
            $table->boolean('encrypted');
            $table->dateTime('fech_data')->nullable();
            $table->string('fech_referencia')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_j2jny3mpptg4l9eb65ydhgrt7');
            $table->integer('usuario_usua_id')->nullable()->index('FK_a2pypwlps868k2h25ijd3x4c9');
        });

        Schema::create('ferias', function (Blueprint $table) {
            $table->integer('fer_id', true);
            $table->boolean('encrypted');
            $table->dateTime('fer_datafim')->nullable();
            $table->dateTime('fer_datainicio')->nullable();
            $table->string('fer_observacoes')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_kud22pc3xtvpc82tvof058f05');
            $table->integer('funcionario_func_id')->nullable()->index('FK_7ogq58mmtmp7gx5g142ds318k');
        });

        Schema::create('firma', function (Blueprint $table) {
            $table->integer('firm_id', true);
            $table->boolean('encrypted');
            $table->string('firm_contacto')->nullable();
            $table->string('firm_descricao')->nullable();
            $table->string('firm_endereco')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_d5jmo64oggci0jrax2wwci3qx');
        });

        Schema::create('fluxo', function (Blueprint $table) {
            $table->integer('flux_id', true);
            $table->boolean('encrypted');
            $table->double('flux_custoVenda');
            $table->dateTime('flux_data')->nullable();
            $table->longText('flux_descricao')->nullable();
            $table->integer('flux_qtd');
            $table->integer('flux_qtdPresente');
            $table->string('flux_referenciaDocumento')->nullable();
            $table->string('flux_tipo')->nullable();
            $table->string('flux_tipoVenda')->nullable();
            $table->integer('flux_ultimoStock');
            $table->integer('cliente_clie_id')->nullable()->index('FK_1yk8x0ntt12sso9u5yfnei4gf');
            $table->integer('entidade_enti_id')->nullable()->index('FK_932fvs2xhjy0ebqf552vry3c8');
            $table->integer('factura_fact_id')->nullable()->index('FK_rx18ia004wj6jp8urmvwfsgkk');
            $table->integer('produto_pro_id')->nullable()->index('FK_oq56wted8d2j7ltb1u1bjfvon');
            $table->integer('turma_turm_id')->nullable()->index('FK_rxxvlgty2vwtusi5mlulpppfe');
            $table->integer('usuario_usua_id')->nullable()->index('FK_9888de7hay47qg0yhagmnx41');
        });

        Schema::create('folhasalarial', function (Blueprint $table) {
            $table->integer('fls_id', true);
            $table->boolean('encrypted');
            $table->double('fls_IRPS');
            $table->double('fls_bonus');
            $table->double('fls_coeficiente');
            $table->dateTime('fls_data')->nullable();
            $table->double('fls_dependentes');
            $table->double('fls_desconto');
            $table->double('fls_limiteInferior');
            $table->string('fls_periodo')->nullable();
            $table->string('fls_referencia')->nullable();
            $table->double('fls_salario');
            $table->integer('entidade_enti_id')->nullable()->index('FK_53fqtis9ydqbgfg7gtge9afxl');
            $table->integer('funcionario_func_id')->nullable()->index('FK_4s3mlynr6yl3p8bxo09c4wgwx');
        });

        Schema::create('formacao', function (Blueprint $table) {
            $table->integer('frm_id', true);
            $table->boolean('encrypted');
            $table->integer('frm_cargahoraria');
            $table->dateTime('frm_dataconclusao')->nullable();
            $table->string('frm_descricao')->nullable();
            $table->string('frm_status')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_gik3tgutl9uodaf2q94scyv3g');
            $table->integer('funcionario_func_id')->nullable()->index('FK_p83i1d8a2jqrag3wv0hwjedrj');
        });

        Schema::create('formulario', function (Blueprint $table) {
            $table->integer('form_id', true);
            $table->string('form_descricao')->nullable();
            $table->string('form_referencia')->nullable();
            $table->integer('sistema_sist_id')->nullable()->index('FK_oax4s6ao8ok58c0a14xdkh5ll');
        });

        Schema::create('formulariosusuario', function (Blueprint $table) {
            $table->integer('formu_id', true);
            $table->boolean('formu_d');
            $table->boolean('formu_i');
            $table->boolean('formu_u');
            $table->boolean('formu_v');
            $table->integer('formulario_form_id')->nullable()->index('FK_qedv1256qr19185d74h659puh');
            $table->integer('moduloUsuario_modu_id')->nullable()->index('FK_akknnmwc7s8jbcgiwk7ffkjpg');
        });

        Schema::create('fornecedor', function (Blueprint $table) {
            $table->integer('for_id', true);
            $table->boolean('encrypted');
            $table->string('for_contaGeral')->nullable();
            $table->string('for_contacto')->nullable();
            $table->string('for_email')->nullable();
            $table->string('for_endereco')->nullable();
            $table->string('for_nome')->nullable();
            $table->bigInteger('for_nuit');
            $table->integer('entidade_enti_id')->nullable()->index('FK_htg20ra8oqcm3h9gc5vr4uybj');
        });

        Schema::create('funcionario', function (Blueprint $table) {
            $table->integer('func_id', true);
            $table->boolean('encrypted');
            $table->string('func_badgnumber')->nullable();
            $table->string('func_conta')->nullable();
            $table->dateTime('func_dataAdmissao')->nullable();
            $table->dateTime('func_dataValidade')->nullable();
            $table->integer('func_dependentes');
            $table->string('func_formaPagamento')->nullable();
            $table->string('func_nib')->nullable();
            $table->integer('func_numero')->nullable();
            $table->double('func_salario');
            $table->double('func_salario_dia');
            $table->double('func_salario_hora');
            $table->string('func_segurancaSocial')->nullable();
            $table->string('func_tipo')->nullable();
            $table->string('func_tipoContrato')->nullable();
            $table->integer('func_turno');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_asduo33c7kpj1pu8m53bgo21k');
            $table->integer('cargo_car_id')->nullable()->index('FK_8hbn26lkhmttkvj53456jqinf');
            $table->integer('departamento_dep_id')->nullable()->index('FK_7enln7j79flqeno2m1akdtvib');
            $table->integer('firmafirm_firm_id')->nullable()->index('FK_7iig7u2dakc9dqvtqfako35rv');
            $table->integer('habilitacao_habi_id')->nullable()->index('FK_mm6nma58ue2cyv16pqjr7j0gb');
            $table->integer('pessoapess_pess_id')->nullable()->index('FK_gvnobskteqgnk8i1tf3e80bqy');
        });

        Schema::create('guiaremessa', function (Blueprint $table) {
            $table->integer('guia_id', true);
            $table->boolean('encrypted');
            $table->dateTime('guia_data')->nullable();
            $table->dateTime('guia_dataAprovacao')->nullable();
            $table->string('guia_designado')->nullable();
            $table->longText('guia_detalhes')->nullable();
            $table->string('guia_documento')->nullable();
            $table->bigInteger('guia_numeroLancamento');
            $table->string('guia_referencia')->nullable();
            $table->string('guia_status')->nullable();
            $table->string('guia_tipo')->nullable();
            $table->integer('cliente_clie_id')->nullable()->index('FK_2ccv55iw83bna0crobsh1xcxw');
            $table->integer('entidade_enti_id')->nullable()->index('FK_o9jkf50bybenc11pbgs2wofgs');
            $table->integer('factura_fact_id')->nullable()->index('FK_l4exrkq98om6k1mhr9k688uls');
            $table->integer('fornecedor_for_id')->nullable()->index('FK_fgm9y04ssd5yjyvd3r8e9kcog');
            $table->integer('usuario_usua_id')->nullable()->index('FK_l40btg65x6s39xpu7f6q3ojsq');
            $table->integer('usuario2_usua_id')->nullable()->index('FK_3pa1ddgb0c6u7r5o3jcpn7jw9');
        });

        Schema::create('habilitacao', function (Blueprint $table) {
            $table->integer('habi_id', true);
            $table->boolean('encrypted');
            $table->string('habi_descricao')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_mpwhy6rc2ob5q7q5ksors7ij4');
        });

        Schema::create('horario', function (Blueprint $table) {
            $table->integer('hora_id', true);
            $table->boolean('encrypted');
            $table->string('hora_fim')->nullable();
            $table->string('hora_inicio')->nullable();
            $table->boolean('hora_usado');
            $table->integer('entidade_enti_id')->nullable()->index('FK_dw45ijcfdjf3ejgtagpfnun3q');
        });

        Schema::create('horas', function (Blueprint $table) {
            $table->integer('hora_id', true);
            $table->boolean('encrypted');
            $table->string('hora_categoria')->nullable();
            $table->dateTime('hora_data')->nullable();
            $table->integer('hora_duracao');
            $table->string('hora_obseravoes')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_dib40nsrei872umfjtkxdh23c');
            $table->integer('funcionario_func_id')->nullable()->index('FK_283l5evl1uv8otjdkda4nl4w1');
        });

        Schema::create('inscricao', function (Blueprint $table) {
            $table->integer('insc_id', true);
            $table->boolean('insc_activa');
            $table->string('insc_anoLectivo')->nullable();
            $table->string('insc_categoria')->nullable();
            $table->boolean('insc_certificado');
            $table->string('insc_comp1')->nullable();
            $table->string('insc_comp2')->nullable();
            $table->string('insc_comp3')->nullable();
            $table->string('insc_comp4')->nullable();
            $table->string('insc_condicao')->nullable();
            $table->boolean('insc_copiaBI');
            $table->dateTime('insc_dataInscricao')->nullable();
            $table->dateTime('insc_dataProximoPagamento')->nullable();
            $table->dateTime('insc_dataUltimoPagamento')->nullable();
            $table->integer('insc_faltas');
            $table->integer('insc_faltasJustificadas');
            $table->boolean('insc_fotos');
            $table->float('insc_notaFinal', 10, 0);
            $table->string('insc_nrTransfercia')->nullable();
            $table->string('insc_origem')->nullable();
            $table->boolean('insc_ppf');
            $table->string('insc_referencia')->nullable();
            $table->boolean('insc_regular');
            $table->string('insc_semestre')->nullable();
            $table->string('insc_turno')->nullable();
            $table->integer('aluno_alun_id')->nullable()->index('FK_s1nuxyfeo8b80m8ni7by9kikr');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_9erfl299rv2wy5n2cp0fn9ks0');
            $table->integer('curso_curs_id')->nullable()->index('FK_gx178uqpqdb0i87lukjifj3nl');
            $table->integer('entidade_enti_id')->nullable()->index('FK_bowie4p725a210no3ukjgtxxi');
            $table->integer('turma_turm_id')->nullable()->index('FK_96ffud0y1ccfyvcwkq1366cn8');
            $table->integer('turno_turn_id')->nullable()->index('FK_yuw9jl6rvbeahytnik5cgh4q');
        });

        Schema::create('isencao', function (Blueprint $table) {
            $table->integer('isen_id', true);
            $table->boolean('encrypted');
            $table->string('isen_codigo')->nullable();
            $table->longText('isen_descricao')->nullable();
            $table->longText('isen_detalhes')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_mcx522b08kyjqksylpusbuu01');
        });

        Schema::create('itempedido', function (Blueprint $table) {
            $table->integer('itp_id', true);
            $table->boolean('encrypted');
            $table->string('itp_cod')->nullable();
            $table->double('itp_custoVenda');
            $table->dateTime('itp_data')->nullable();
            $table->double('itp_desconto');
            $table->longText('itp_descricao')->nullable();
            $table->double('itp_iva');
            $table->double('itp_precoIva');
            $table->double('itp_precoIvaMedio');
            $table->double('itp_precoMedio');
            $table->double('itp_precoTotal');
            $table->double('itp_precoTotalMedio');
            $table->double('itp_precoUnit');
            $table->integer('itp_quantidade');
            $table->integer('itp_refProduto');
            $table->string('itp_referencia')->nullable();
            $table->bigInteger('itp_referenciaFactura');
            $table->string('itp_referenciaGuia')->nullable();
            $table->string('itp_tipoVenda')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_m6m2s7nhn25qfgodw35mi4ksr');
            $table->integer('factura_fact_id')->nullable()->index('FK_gcnldac310v1ro23xsngeq89');
            $table->integer('guiaRemessa_guia_id')->nullable()->index('FK_5gafq0bq1ce9j0mlo6436y6hk');
        });

        Schema::create('itemrequisicao', function (Blueprint $table) {
            $table->integer('itr_id', true);
            $table->boolean('encrypted');
            $table->string('itr_descricao')->nullable();
            $table->integer('itr_qtd');
            $table->double('itr_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_739knyv4nj73gyrsch0pt46ay');
            $table->integer('requisicao_req_id')->nullable()->index('FK_9lp4bpu7ge71o3033i0qh1woh');
        });

        Schema::create('itemrequisicaocheque', function (Blueprint $table) {
            $table->integer('irc_id', true);
            $table->boolean('encrypted');
            $table->string('irc_beneficiario')->nullable();
            $table->integer('irc_ref');
            $table->double('irc_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_12197cy63f32t5lair2notisb');
            $table->integer('requisicaoCheque_rqc_id')->nullable()->index('FK_ewpabkfw2dqvp7tsk3cx5vnyg');
        });

        Schema::create('lancamento', function (Blueprint $table) {
            $table->integer('lan_id', true);
            $table->boolean('encrypted');
            $table->date('lan_data')->nullable();
            $table->longText('lan_descricao')->nullable();
            $table->double('lan_iva');
            $table->bigInteger('lan_numero');
            $table->string('lan_operacao')->nullable();
            $table->string('lan_referencia')->nullable();
            $table->string('lan_referenciaDiario')->nullable();
            $table->string('lan_referenciaDocumento')->nullable();
            $table->string('lan_referenciaMovimento')->nullable();
            $table->double('lan_valor');
            $table->integer('contaCliente_ctg_id')->nullable()->index('FK_mprqyx6w9rr06o84bodlm3406');
            $table->integer('contaPlano_ctg_id')->nullable()->index('FK_slrnvtmw8hgql7iie4yhwar21');
            $table->integer('diario_dir_id')->nullable()->index('FK_2swohlsdgt8vf5eykgnxgdl3e');
            $table->integer('documento_doc_id')->nullable()->index('FK_7oolibak82pjyp9pnd0o9crvx');
            $table->integer('entidade_enti_id')->nullable()->index('FK_oyykrytdsxa69dw06x1dpus9t');
            $table->integer('factura_fact_id')->nullable()->index('FK_4q6hf7htlr5elu5u89juqux52');
            $table->integer('funcionario_func_id')->nullable()->index('FK_67f5hhyr6l5mdaer2m1j6qdmv');
            $table->integer('usuario_usua_id')->nullable()->index('FK_r4j1v194l8i4ysuagvryxpjlp');
        });

        Schema::create('lembrete', function (Blueprint $table) {
            $table->integer('lemb_id', true);
            $table->boolean('encrypted');
            $table->dateTime('lemb_data')->nullable();
            $table->string('lemb_descricao')->nullable();
            $table->longText('lemb_detalhes')->nullable();
            $table->string('lemb_referencia')->nullable();
            $table->boolean('lemb_sent');
            $table->integer('entidade_enti_id')->nullable()->index('FK_3qtx9c5ectk7q1la7jb0vmb8d');
            $table->integer('usuario_usua_id')->nullable()->index('FK_83e03e4682r7v5nyfl0il6kpc');
        });

        Schema::create('listatelefonica', function (Blueprint $table) {
            $table->integer('lst_id', true);
            $table->boolean('encrypted');
            $table->string('lst_categoria')->nullable();
            $table->string('lst_nome')->nullable();
            $table->string('lst_telefone')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_gmjl77s4abl5s2w1ldn62necl');
        });

        Schema::create('log', function (Blueprint $table) {
            $table->integer('log_id', true);
            $table->boolean('encrypted');
            $table->dateTime('log_data')->nullable();
            $table->string('log_descricao')->nullable();
            $table->string('log_hora')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_53yj8pgaidsaeif40iu3ltj7k');
            $table->integer('sistema_sist_id')->nullable()->index('FK_17hwvurguvvlewxi4utq6fe59');
            $table->integer('usuario_usua_id')->nullable()->index('FK_hrw7vv9m5xq0synxuq10kmfay');
        });

        Schema::create('matricula', function (Blueprint $table) {
            $table->integer('matr_id', true);
            $table->string('cod_escola')->nullable();
            $table->string('matr_ano')->nullable();
            $table->integer('matr_assistente');
            $table->string('matr_classe')->nullable();
            $table->integer('matr_continuante');
            $table->integer('matr_faixa_05');
            $table->integer('matr_faixa_1115');
            $table->integer('matr_faixa_1625');
            $table->integer('matr_faixa_2635');
            $table->integer('matr_faixa_35');
            $table->integer('matr_faixa_610');
            $table->integer('matr_homens');
            $table->integer('matr_mulheres');
            $table->integer('matr_novo');
            $table->integer('matr_repetente');
            $table->integer('matr_transferido');
            $table->integer('matr_turmas');
            $table->integer('matr_vuneraveis');
        });

        Schema::create('media', function (Blueprint $table) {
            $table->integer('medi_id', true);
            $table->boolean('encrypted');
            $table->string('med_semestre')->nullable();
            $table->float('medi_media', 10, 0);
            $table->float('medi_media2', 10, 0);
            $table->float('medi_media3', 10, 0);
            $table->integer('aluno_alun_id')->nullable()->index('FK_a5y2kmp2d4ps55ejivqqxkq4q');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_syeeo0owc0kpoi63pms4jncrq');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_8c1otoe3gpk18icphq8m7swwq');
            $table->integer('entidade_enti_id')->nullable()->index('FK_24j3ky0oiyqrnbb6njf1hcvcj');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_ie7tc2p7ppkh5r56t09ydlkfm');
            $table->integer('turma_turm_id')->nullable()->index('FK_dq9itvdjwejv4xxe58gdxckd4');
        });

        Schema::create('meiopagamento', function (Blueprint $table) {
            $table->integer('meio_id', true);
            $table->boolean('encrypted');
            $table->string('meio_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_8lf5vr0g0jmtxi28w4q3sotj8');
        });

        Schema::create('mensalidade', function (Blueprint $table) {
            $table->integer('mens_id', true);
            $table->boolean('encrypted');
            $table->dateTime('mens_dataInscricao')->nullable();
            $table->dateTime('mens_dataPagamento')->nullable();
            $table->dateTime('mens_dataProximoPagamento')->nullable();
            $table->string('mens_estado')->nullable();
            $table->integer('aluno_alun_id')->nullable()->index('FK_4vprncqyqt1w7rcsqd809l8so');
            $table->integer('curso_curs_id')->nullable()->index('FK_rq9ygnvbbk6etbp9awc9kstfu');
            $table->integer('entidade_enti_id')->nullable()->index('FK_55drx7a8y9d0yjxfmivwcqxqj');
        });

        Schema::create('modulo', function (Blueprint $table) {
            $table->integer('modu_id', true);
            $table->boolean('encrypted');
            $table->double('modu_credito');
            $table->string('modu_descricao')->nullable();
            $table->integer('modu_durcao');
            $table->double('modu_preco');
            $table->integer('curso_curs_id')->nullable()->index('FK_adl9w4cemnv5u8vaows0dsgi4');
            $table->integer('entidade_enti_id')->nullable()->index('FK_35wc18gb5q0mek2vgauchahr');
        });

        Schema::create('moduloacesso', function (Blueprint $table) {
            $table->integer('moac_id', true);
            $table->boolean('encrypted');
            $table->string('moac_baseDados')->nullable();
            $table->string('moac_chaveAcesso')->nullable();
            $table->string('moac_chaveUsuarios')->nullable();
            $table->dateTime('moac_dataActivacao')->nullable();
            $table->dateTime('moac_dataFinalTrial')->nullable();
            $table->string('moac_dataFinalTrialEncry')->nullable();
            $table->integer('moac_diasRemanescentes')->nullable();
            $table->string('moac_diasRemanescentesEncry')->nullable();
            $table->string('moac_imagemFundo')->nullable();
            $table->string('moac_perfilCores')->nullable();
            $table->integer('entidadeenti_enti_id')->nullable()->index('FK_ksdsgaq9vxjai8v1e06a344e1');
            $table->integer('sistema_sist_id')->nullable()->index('FK_jc0kkxavfkfp4f0yb1d3iyod8');
        });

        Schema::create('modulosusuario', function (Blueprint $table) {
            $table->integer('mui_id', true);
            $table->boolean('encrypted');
            $table->boolean('mui_activos');
            $table->boolean('mui_aprovacaoDespesas');
            $table->boolean('mui_armazem');
            $table->boolean('mui_avaliacao');
            $table->boolean('mui_avaliacao_boletins');
            $table->boolean('mui_avaliacao_notas');
            $table->boolean('mui_avaliacao_observacoes');
            $table->boolean('mui_avaliacao_pautas');
            $table->boolean('mui_avaliacao_presencas');
            $table->boolean('mui_bancos');
            $table->boolean('mui_biblioteca');
            $table->boolean('mui_calendario');
            $table->boolean('mui_calendario_exames');
            $table->boolean('mui_calendario_horario');
            $table->boolean('mui_calendario_recorrencias');
            $table->boolean('mui_calendario_testes');
            $table->boolean('mui_clientes');
            $table->boolean('mui_comercial');
            $table->boolean('mui_configuracao');
            $table->boolean('mui_contratos');
            $table->boolean('mui_cursos');
            $table->boolean('mui_cursos_areasInscricao');
            $table->boolean('mui_cursos_cursos');
            $table->boolean('mui_cursos_cursosCentro');
            $table->boolean('mui_cursos_modulos');
            $table->boolean('mui_depositos');
            $table->boolean('mui_despesas');
            $table->boolean('mui_despesas_estoque');
            $table->boolean('mui_despesas_extracto');
            $table->boolean('mui_despesas_formacao');
            $table->boolean('mui_despesas_internas');
            $table->boolean('mui_disciplinas');
            $table->boolean('mui_disciplinas_curso');
            $table->boolean('mui_disciplinas_docente');
            $table->boolean('mui_disciplinas_gestao');
            $table->boolean('mui_disciplinas_turma');
            $table->boolean('mui_docuemntos');
            $table->boolean('mui_empresas');
            $table->boolean('mui_estatisticas');
            $table->boolean('mui_estatisticas_curso');
            $table->boolean('mui_estatisticas_gerais');
            $table->boolean('mui_facturas');
            $table->boolean('mui_financeiro');
            $table->boolean('mui_formasPagamento');
            $table->boolean('mui_fornecedores');
            $table->boolean('mui_gestao');
            $table->boolean('mui_gestao_centros');
            $table->boolean('mui_gestao_formadores');
            $table->boolean('mui_gestao_formados');
            $table->boolean('mui_gestao_inscricoes');
            $table->boolean('mui_gestao_parceiros');
            $table->boolean('mui_gestao_turmas');
            $table->boolean('mui_guiasRemessa');
            $table->boolean('mui_lancamentos');
            $table->boolean('mui_lembres');
            $table->boolean('mui_moedas');
            $table->boolean('mui_pagamentos');
            $table->boolean('mui_pagamentos_multas');
            $table->boolean('mui_pagamentos_outrosPagamentos');
            $table->boolean('mui_pagamentos_pagamentosOnline');
            $table->boolean('mui_pagamentos_propinas');
            $table->boolean('mui_pagamentos_situacaoPagamentos');
            $table->boolean('mui_pagamentos_taxas');
            $table->boolean('mui_petyCash');
            $table->boolean('mui_planosDeConta');
            $table->boolean('mui_produtos');
            $table->boolean('mui_recursosHumanos');
            $table->boolean('mui_requisicoes');
            $table->boolean('mui_requisicoes_add');
            $table->boolean('mui_requisicoes_aprove');
            $table->boolean('mui_requisicoes_list');
            $table->boolean('mui_requisicoes_status');
            $table->boolean('mui_resultados');
            $table->boolean('mui_usuarios');
            $table->boolean('mui_usuarios_add');
            $table->boolean('mui_usuarios_logs');
            $table->boolean('mui_usuarios_permissoes');
            $table->boolean('mui_usuarios_status');
            $table->boolean('mui_vendas');
            $table->integer('entidade_enti_id')->nullable()->index('FK_lpxi2bq9hq5esqwyk3y8vr7vh');
            $table->integer('usuario_usua_id')->nullable()->index('FK_5nnpix6in7o42ph0bxrxofc18');
        });

        Schema::create('modulosusuariomarket', function (Blueprint $table) {
            $table->integer('mui_id', true);
            $table->boolean('encrypted');
            $table->boolean('mui_activos');
            $table->boolean('mui_bancos');
            $table->boolean('mui_clientes');
            $table->boolean('mui_depositos');
            $table->boolean('mui_despesas');
            $table->boolean('mui_empresas');
            $table->boolean('mui_estatisticas');
            $table->boolean('mui_facturas');
            $table->boolean('mui_formasPagamento');
            $table->boolean('mui_fornecedores');
            $table->boolean('mui_guiasRemessa');
            $table->boolean('mui_lancamentos');
            $table->boolean('mui_moedas');
            $table->boolean('mui_petyCash');
            $table->boolean('mui_planosDeConta');
            $table->boolean('mui_produtos');
            $table->boolean('mui_recursosHumanos');
            $table->boolean('mui_requisicoes');
            $table->boolean('mui_requisicoes_add');
            $table->boolean('mui_requisicoes_aprove');
            $table->boolean('mui_requisicoes_list');
            $table->boolean('mui_requisicoes_status');
            $table->boolean('mui_resultados');
            $table->boolean('mui_usuarios');
            $table->boolean('mui_vendas');
            $table->integer('entidade_enti_id')->nullable()->index('FK_ibpxaq5rn7mikbprq7ejgmxf7');
            $table->integer('usuario_usua_id')->nullable()->index('FK_fn5lc3asuu38xwaddm5b79cvo');
        });

        Schema::create('modulousuario', function (Blueprint $table) {
            $table->integer('modu_id', true);
            $table->boolean('encrypted');
            $table->dateTime('modu_dataUltimoLogin')->nullable();
            $table->string('modu_referencia')->nullable();
            $table->integer('modu_visitas');
            $table->integer('moduloAcesso_moac_id')->nullable()->index('FK_84t0hynggh54oqmn0mt2hax6o');
            $table->integer('usuario_usua_id')->nullable()->index('FK_hxhp0fppiir6fjjdfk6cpig11');
        });

        Schema::create('moeda', function (Blueprint $table) {
            $table->integer('moe_id', true);
            $table->boolean('encrypted');
            $table->double('moe_cambio')->nullable();
            $table->string('moe_nome')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_2rnrolstx6iaj0b4vgk0wbjd2');
        });

        Schema::create('movimento', function (Blueprint $table) {
            $table->integer('mov_id', true);
            $table->boolean('encrypted');
            $table->string('mov_benefeciario')->nullable();
            $table->double('mov_credito');
            $table->dateTime('mov_data')->nullable();
            $table->dateTime('mov_dataEmissao')->nullable();
            $table->double('mov_debito');
            $table->longText('mov_detalhes')->nullable();
            $table->string('mov_nrCheque')->nullable();
            $table->string('mov_referencia')->nullable();
            $table->double('mov_saldo');
            $table->integer('banco_bnc_id')->nullable()->index('FK_r01a5wotlfpfssovpw16olj6f');
            $table->integer('entidade_enti_id')->nullable()->index('FK_16gy57vr9j4vlabrkkaf5yonr');
            $table->integer('usuario_usua_id')->nullable()->index('FK_dm0ob0oesk0xfe2qmggquu371');
        });

        Schema::create('nacionalidade', function (Blueprint $table) {
            $table->integer('naci_id', true);
            $table->boolean('encrypted');
            $table->string('naci_descricao')->nullable();
        });

        Schema::create('nivelacesso', function (Blueprint $table) {
            $table->integer('niva_id', true);
            $table->boolean('encrypted');
            $table->string('niva_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_5rlfyqoopm3uj1020x77t1c8q');
        });

        Schema::create('nivelprioridade', function (Blueprint $table) {
            $table->integer('nvp_id', true);
            $table->boolean('encrypted');
            $table->string('nvp_descricao')->nullable();
        });

        Schema::create('notas', function (Blueprint $table) {
            $table->integer('nota_id', true);
            $table->boolean('encrypted');
            $table->boolean('isAcp2');
            $table->boolean('isTeste3');
            $table->boolean('isTeste4');
            $table->float('nota_acp', 10, 0);
            $table->float('nota_acp2', 10, 0);
            $table->float('nota_avaliacaoContinua', 10, 0);
            $table->float('nota_media', 10, 0);
            $table->string('nota_semestre')->nullable();
            $table->float('nota_teste1', 10, 0);
            $table->float('nota_teste2', 10, 0);
            $table->float('nota_teste3', 10, 0);
            $table->float('nota_teste4', 10, 0);
            $table->float('nota_trabPratico', 10, 0);
            $table->integer('aluno_alun_id')->nullable()->index('FK_m9xigny2j8ml20pbayewwoxa0');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_npauu1jp16y8ynvkx1gxuyp92');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_8pfotl50da7a8bptenacyt172');
            $table->integer('entidade_enti_id')->nullable()->index('FK_8tunkwvd1cb5vqhdw500mw2tm');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_1c8qjujjprm04lmiy71pcjrf7');
            $table->integer('turma_turm_id')->nullable()->index('FK_fe3oe0fg0bqbr3s7itq7qufxc');
        });

        Schema::create('pagamento', function (Blueprint $table) {
            $table->integer('pag_id', true);
            $table->boolean('encrypted');
            $table->boolean('online');
            $table->boolean('pag_actual');
            $table->string('pag_categorizacao')->nullable();
            $table->double('pag_comissao');
            $table->string('pag_condicao')->nullable();
            $table->dateTime('pag_data')->nullable();
            $table->dateTime('pag_dataLimite')->nullable();
            $table->dateTime('pag_dataPagamento')->nullable();
            $table->string('pag_descricao')->nullable();
            $table->string('pag_estado')->nullable();
            $table->string('pag_formaPagamento')->nullable();
            $table->double('pag_multa');
            $table->string('pag_origem')->nullable();
            $table->string('pag_periodo')->nullable();
            $table->string('pag_recibo')->nullable();
            $table->string('pag_refElectronico')->nullable();
            $table->string('pag_refOnline')->nullable();
            $table->string('pag_referencia')->nullable();
            $table->boolean('pag_status');
            $table->double('pag_valor');
            $table->double('pag_valorPago');
            $table->integer('caixa_caix_id')->nullable()->index('FK_3idshtgvh2x3c7xqp8e28govb');
            $table->integer('entidade_enti_id')->nullable()->index('FK_4hjbtodk3l25mgwmf53nsg9kf');
            $table->integer('inscricao_insc_id')->nullable()->index('FK_1kd8i3l96jcb8q95oo4m5chy3');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_peu87n5vy56271rmp1ca1n8rx');
            $table->integer('reciboPagamento_recp_id')->nullable()->index('FK_lyevni07eq966mcvq9mkkk25v');
            $table->integer('turma_turm_id')->nullable()->index('FK_2npd64r3pm1bfeo5okvtkqeud');
        });

        Schema::create('parceiro', function (Blueprint $table) {
            $table->integer('parc_id', true);
            $table->boolean('encrypted');
            $table->string('parc_areaActuacao')->nullable();
            $table->string('parc_contacto')->nullable();
            $table->string('parc_descricao')->nullable();
            $table->string('parc_endereco')->nullable();
            $table->string('parc_nuit')->nullable();
            $table->string('parc_pessoaContacto')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_8xcy30fnj5f3aivlrebj77chw');
        });

        Schema::create('pdf', function (Blueprint $table) {
            $table->integer('pdf_id', true);
            $table->boolean('encrypted');
            $table->dateTime('pdf_data')->nullable();
            $table->string('pdf_descricaoDocumento')->nullable();
            $table->string('pdf_hora')->nullable();
            $table->string('pdf_nomeDocumento')->nullable();
            $table->string('pdf_subPath')->nullable();
            $table->string('pdf_tipoDocumento')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_dixllrvenrnav3xhbvxafw4k7');
        });

        Schema::create('periodosalarial', function (Blueprint $table) {
            $table->integer('pers_id', true);
            $table->boolean('encrypted');
            $table->dateTime('pers_data')->nullable();
            $table->string('pers_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_n86ghfraa4lntmqncj46ws0cr');
            $table->integer('usuario_usua_id')->nullable()->index('FK_amkgr1nuve6rn2x9l1wwidi7x');
            $table->integer('usuarioAutoriza_usua_id')->nullable()->index('FK_g6hynq896la38h54a9ncjfbwt');
            $table->integer('usuarioVerifica_usua_id')->nullable()->index('FK_9ftg9tf7g0yisx31vxp7au8jm');
        });

        Schema::create('personal_access_tokens', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('tokenable_type');
            $table->unsignedBigInteger('tokenable_id');
            $table->string('name');
            $table->string('token', 64)->unique();
            $table->text('abilities')->nullable();
            $table->timestamp('last_used_at')->nullable();
            $table->timestamps();

            $table->index(['tokenable_type', 'tokenable_id']);
        });

        Schema::create('pessoa', function (Blueprint $table) {
            $table->integer('pess_id', true);
            $table->boolean('encrypted');
            $table->string('pess_actividade')->nullable();
            $table->float('pess_altura', 10, 0)->nullable();
            $table->string('pess_apelido')->nullable();
            $table->string('pess_bairro')->nullable();
            $table->string('pess_bi')->nullable();
            $table->string('pess_cPostal')->nullable();
            $table->string('pess_cidade')->nullable();
            $table->string('pess_contacto')->nullable();
            $table->string('pess_contactoMae')->nullable();
            $table->string('pess_contactoPai')->nullable();
            $table->dateTime('pess_dataCadastro')->nullable();
            $table->string('pess_dataEmissaoBi')->nullable();
            $table->dateTime('pess_dataNascimento')->nullable();
            $table->string('pess_dataValidadeBi')->nullable();
            $table->string('pess_distrito')->nullable();
            $table->string('pess_documento')->nullable();
            $table->string('pess_educacao')->nullable();
            $table->string('pess_email')->nullable();
            $table->string('pess_estadoCivil')->nullable();
            $table->string('pess_foto')->nullable();
            $table->string('pess_generoActividae')->nullable();
            $table->string('pess_generoAlimentacao')->nullable();
            $table->string('pess_generoBebida')->nullable();
            $table->string('pess_generoCultura')->nullable();
            $table->string('pess_generoEntretenimento')->nullable();
            $table->string('pess_generoFilme')->nullable();
            $table->string('pess_generoMusica')->nullable();
            $table->string('pess_grauParentesco')->nullable();
            $table->string('pess_hobbie')->nullable();
            $table->string('pess_lingua')->nullable();
            $table->string('pess_localTrabalho')->nullable();
            $table->string('pess_nome')->nullable();
            $table->string('pess_nomeMae')->nullable();
            $table->string('pess_nomePai')->nullable();
            $table->string('pess_nuit')->nullable();
            $table->string('pess_numeroCasa')->nullable();
            $table->string('pess_origemRegisto')->nullable();
            $table->string('pess_pais')->nullable();
            $table->string('pess_profissaoMae')->nullable();
            $table->string('pess_profissaoPai')->nullable();
            $table->string('pess_provincia')->nullable();
            $table->string('pess_raca')->nullable();
            $table->string('pess_relegiao')->nullable();
            $table->string('pess_responsavel')->nullable();
            $table->string('pess_rua')->nullable();
            $table->string('pess_sector')->nullable();
            $table->string('pess_sexo')->nullable();
            $table->string('pess_sinais')->nullable();
            $table->string('pess_skills')->nullable();
            $table->string('pess_sobre')->nullable();
            $table->string('pess_tipo')->nullable();
            $table->string('pess_trabalhoMae')->nullable();
            $table->string('pess_trabalhoPai')->nullable();
            $table->string('pess_vicios')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_nagwq4oa5q56x94iak41d0v3e');
            $table->integer('nacionalidadenaci_naci_id')->nullable()->index('FK_sgqnd7nxdd12e55k3xchh6m69');
        });

        Schema::create('pety', function (Blueprint $table) {
            $table->integer('pety_id', true);
            $table->boolean('encrypted');
            $table->string('pety_periodo')->nullable();
            $table->double('pety_valorrestante');
            $table->double('pety_valortotal');
            $table->integer('entidade_enti_id')->nullable()->index('FK_iv3p9fufx82ldaso32d8ap72q');
        });

        Schema::create('petycash', function (Blueprint $table) {
            $table->integer('pet_id', true);
            $table->boolean('encrypted');
            $table->dateTime('pet_data')->nullable();
            $table->longText('pet_descricao')->nullable();
            $table->double('pet_saldoAnterior');
            $table->double('pet_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_orvmwxycgqy4xmatsyu7gwr88');
            $table->integer('funcionario_func_id')->nullable()->index('FK_dk2s8208hgpkswub1mw8ijbsu');
            $table->integer('pety_pety_id')->nullable()->index('FK_ltkehpnnjldfkdcs956udkaph');
            $table->integer('usuario_usua_id')->nullable()->index('FK_9m9qm0m3h894fd2ttfad9br3q');
        });

        Schema::create('planodeconta', function (Blueprint $table) {
            $table->integer('pdc_id', true);
            $table->boolean('encrypted');
            $table->string('pdc_codigo')->nullable();
            $table->string('pdc_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_m0js5l1tb10ewts4u63mh0qre');
            $table->integer('planoDeConta_pdc_id')->nullable()->index('FK_jkqiofgh5a5sp15sf2h4fkwix');
        });

        Schema::create('planosaude', function (Blueprint $table) {
            $table->integer('pls_id', true);
            $table->boolean('encrypted');
            $table->string('pls_avaliacao')->nullable();
            $table->dateTime('pls_data')->nullable();
            $table->string('pls_descricao')->nullable();
            $table->string('pls_medico')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_9vny1fyrci8v5cdcqlwqrnovr');
            $table->integer('funcionario_func_id')->nullable()->index('FK_rg0xllsi66v9golf1n1pa53y');
        });

        Schema::create('preco', function (Blueprint $table) {
            $table->integer('pre_id', true);
            $table->double('pre_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_giqja0oe0jkxn2qto934lj3k7');
        });

        Schema::create('presencas', function (Blueprint $table) {
            $table->integer('pres_id', true);
            $table->boolean('encrypted');
            $table->dateTime('pres_data')->nullable();
            $table->integer('pres_faltas');
            $table->integer('aluno_alun_id')->nullable()->index('FK_1s86gw2gw3q1m1mob9nmndn4t');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_jrbwgptv6250nuxyvpvl4wfra');
            $table->integer('entidade_enti_id')->nullable()->index('FK_sdk292n9vboqcl0yhmt6kuwf3');
            $table->integer('turma_turm_id')->nullable()->index('FK_o16ns9ve81vtu7xcxhuj6cmqx');
        });

        Schema::create('produto', function (Blueprint $table) {
            $table->integer('pro_id', true);
            $table->boolean('encrypted');
            $table->string('pro_codigo')->nullable();
            $table->string('pro_codigo_barras')->nullable();
            $table->dateTime('pro_dataFabrico')->nullable();
            $table->dateTime('pro_dataValidade')->nullable();
            $table->string('pro_descriminacao')->nullable();
            $table->longText('pro_detalhes')->nullable();
            $table->integer('pro_estoque');
            $table->string('pro_imagem')->nullable();
            $table->string('pro_marca')->nullable();
            $table->integer('pro_margemAlarme');
            $table->longText('pro_nome')->nullable();
            $table->double('pro_preco');
            $table->double('pro_preco2');
            $table->double('pro_precoCompra');
            $table->string('pro_segmento')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_k8hoadduq8snpouaq9nhvo6uo');
            $table->integer('categoriaProduto_catp_id')->nullable()->index('FK_o41y7r98r75obaqbbdc2hjl9c');
            $table->integer('cor_cor_id')->nullable()->index('FK_idmkj9i4kwl7u1vsk7euocw26');
            $table->integer('fornecedor_for_id')->nullable()->index('FK_96q57to8p0qtfln1txppbodkj');
            $table->integer('tamanho_tam_id')->nullable()->index('FK_ksnpb5s9vhlw4qyet836xq14q');
        });

        Schema::create('produtorequisicao', function (Blueprint $table) {
            $table->integer('prr_id', true);
            $table->dateTime('prr_data')->nullable();
            $table->integer('prr_qtd');
            $table->string('prr_referencia')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_dpt8opp9wngpymymemi9vbjvf');
            $table->integer('produto_pro_id')->nullable()->index('FK_s3p36wffag6kuyhpkd7lt6buf');
            $table->integer('requisicaoMaterial_reqm_id')->nullable()->index('FK_hw3o2yqbiowis42lgn131b1up');
        });

        Schema::create('produtovendido', function (Blueprint $table) {
            $table->integer('prv_id', true);
            $table->double('prv_ajuste');
            $table->double('prv_custoVenda');
            $table->dateTime('prv_data')->nullable();
            $table->double('prv_desconto');
            $table->longText('prv_descricao')->nullable();
            $table->double('prv_iva');
            $table->double('prv_precoCusto');
            $table->double('prv_precoMedio');
            $table->integer('prv_qtd');
            $table->string('prv_referencia')->nullable();
            $table->string('prv_tipoVenda')->nullable();
            $table->double('prv_total');
            $table->double('prv_totalIva');
            $table->double('prv_totalIvaMedio');
            $table->double('prv_totalPrecoMedio');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_1qfvgbf47f67lm1qe141li2w');
            $table->integer('factura_fact_id')->nullable()->index('FK_fd71ro974t7t11hmtn5tmcf6r');
            $table->integer('produto_pro_id')->nullable()->index('FK_bvo0424p1lwo9u8ri6oxcykry');
        });

        Schema::create('recibo', function (Blueprint $table) {
            $table->integer('rec_id', true);
            $table->boolean('encrypted');
            $table->dateTime('rec_data')->nullable();
            $table->bigInteger('rec_lancamento');
            $table->double('rec_mullta');
            $table->longText('rec_observacoes')->nullable();
            $table->string('rec_recebemosDe')->nullable();
            $table->string('rec_referencia')->nullable();
            $table->double('rec_total');
            $table->double('rec_valor');
            $table->string('ref_bancoPagamento')->nullable();
            $table->string('ref_nrDocumentoPagamento')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_een6cvnfnmhsu7a1fr28gwdoh');
            $table->integer('factura_fact_id')->nullable()->index('FK_qwr1eh0n82isctf14l2udpkpf');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_mruycpcwb5friinmuxpf2bg4l');
        });

        Schema::create('recibopagamento', function (Blueprint $table) {
            $table->integer('recp_id', true);
            $table->boolean('encrypted');
            $table->dateTime('recp_data')->nullable();
            $table->bigInteger('recp_lancamento');
            $table->double('recp_multa');
            $table->longText('recp_observacoes')->nullable();
            $table->string('recp_recebemosDe')->nullable();
            $table->string('recp_referencia')->nullable();
            $table->double('recp_total');
            $table->double('recp_valor');
            $table->string('ref_bancoPagamento')->nullable();
            $table->string('ref_nrDocumentoPagamento')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_a5nlf4y0qhcurr6q4vn8ebfym');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_a9twha88ftu3gf0x0966lj23x');
        });

        Schema::create('referencia', function (Blueprint $table) {
            $table->integer('ref_id', true);
            $table->integer('ref_adenda');
            $table->string('ref_ano')->nullable();
            $table->integer('ref_banco');
            $table->integer('ref_bordos');
            $table->integer('ref_budget');
            $table->integer('ref_cliente');
            $table->integer('ref_compras');
            $table->integer('ref_contrato');
            $table->integer('ref_curso');
            $table->integer('ref_deposito');
            $table->integer('ref_despesa');
            $table->integer('ref_diario');
            $table->integer('ref_disciplina');
            $table->integer('ref_docente');
            $table->integer('ref_documento');
            $table->string('ref_entidade')->nullable();
            $table->integer('ref_estudante');
            $table->integer('ref_estudanteAprovacoes');
            $table->integer('ref_estudanteDispensas');
            $table->integer('ref_estudanteExclusoes');
            $table->integer('ref_estudanteReprovacoes');
            $table->integer('ref_extractoCliente');
            $table->integer('ref_extractoStockArtigo');
            $table->integer('ref_extractoStockGeral');
            $table->integer('ref_factura');
            $table->integer('ref_facturaProForma');
            $table->integer('ref_faltas');
            $table->integer('ref_faltasJustificadas');
            $table->integer('ref_fecho');
            $table->integer('ref_fornecedor');
            $table->integer('ref_funcionario');
            $table->integer('ref_guia');
            $table->integer('ref_guiaAbate');
            $table->integer('ref_guiaEntrada');
            $table->integer('ref_guiaRemessa');
            $table->integer('ref_inscricoes');
            $table->integer('ref_lancamento');
            $table->integer('ref_lembrete');
            $table->integer('ref_movimento');
            $table->integer('ref_notaCredito');
            $table->integer('ref_notaDebito');
            $table->integer('ref_pagamento');
            $table->integer('ref_pagamentos');
            $table->integer('ref_pety');
            $table->integer('ref_petycash');
            $table->integer('ref_processamento');
            $table->integer('ref_recibo');
            $table->integer('ref_reciboPagamento');
            $table->integer('ref_requisicao');
            $table->integer('ref_requisicaoCheque');
            $table->integer('ref_salario');
            $table->integer('ref_turma');
            $table->integer('ref_vendaDinheiro');
            $table->integer('ref_vendas');
        });

        Schema::create('registofecho', function (Blueprint $table) {
            $table->integer('regf_id', true);
            $table->dateTime('regf_data')->nullable();
            $table->integer('regf_qtd');
            $table->integer('entidade_enti_id')->nullable()->index('FK_gc4430dvlvhhefsyik11qrmvs');
            $table->integer('fecho_fech_id')->nullable()->index('FK_f060lgbl3b9vy1jxd4i75mfe0');
            $table->integer('produto_pro_id')->nullable()->index('FK_fgmxjvb8v0ba0ck8akdt7bj90');
        });

        Schema::create('requisicao', function (Blueprint $table) {
            $table->integer('req_id', true);
            $table->boolean('encrypted');
            $table->dateTime('req_data')->nullable();
            $table->string('req_serie')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_7falwqwg4kgiadq71fih8ktew');
            $table->integer('funcionario_func_id')->nullable()->index('FK_k8gdenp9s9gtsh4sckx68n9dp');
        });

        Schema::create('requisicaocheque', function (Blueprint $table) {
            $table->integer('rqc_id', true);
            $table->boolean('encrypted');
            $table->string('rpc_beneficiario')->nullable();
            $table->string('rpc_criterio')->nullable();
            $table->longText('rpc_descricao')->nullable();
            $table->string('rpc_movimento')->nullable();
            $table->dateTime('rqc_data')->nullable();
            $table->string('rqc_nrCheque')->nullable();
            $table->string('rqc_serie')->nullable();
            $table->double('rqc_valor');
            $table->longText('rqc_valorExtenso')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_78crg2eren4brq6s86t1mfk1g');
            $table->integer('funcionario_func_id')->nullable()->index('FK_368l0h722rhcf58hyaodn7v70');
            $table->integer('tipoMovimentoCheque_tmc_id')->nullable()->index('FK_sfn6anbmwqw1g12vn474lgr3w');
            $table->integer('usuario_usua_id')->nullable()->index('FK_hqdc0yqgj4xhim1y67130pu1b');
        });

        Schema::create('requisicaofundo', function (Blueprint $table) {
            $table->integer('reqf_id', true);
            $table->boolean('encrypted');
            $table->dateTime('reqf_data')->nullable();
            $table->dateTime('reqf_dataAlteracao')->nullable();
            $table->dateTime('reqf_dataAprovacao')->nullable();
            $table->dateTime('reqf_dataAprovacaoRH')->nullable();
            $table->dateTime('reqf_dataAprovacaoRegiao')->nullable();
            $table->dateTime('reqf_dataAprovacaoSede')->nullable();
            $table->dateTime('reqf_dataJustificativo')->nullable();
            $table->longText('reqf_detalhes')->nullable();
            $table->longText('reqf_link')->nullable();
            $table->longText('reqf_linkJustificativo')->nullable();
            $table->string('reqf_referencia')->nullable();
            $table->string('reqf_segmento')->nullable();
            $table->string('reqf_status')->nullable();
            $table->double('reqf_valor');
            $table->integer('contrato_cont_id')->nullable()->index('FK_tfedl3oltb9o8eovef5efsc66');
            $table->integer('entidade_enti_id')->nullable()->index('FK_8vvou31981olxqv7d40psh6m2');
            $table->integer('usuario_usua_id')->nullable()->index('FK_eolskwf9et44ahtpr0t2nbgad');
            $table->integer('usuario2_usua_id')->nullable()->index('FK_7jqsyys08pv6isl6b7yb9xre0');
            $table->integer('usuario3_usua_id')->nullable()->index('FK_sdwxlng1jw3w633jmrg2oa9ic');
            $table->integer('usuario4_usua_id')->nullable()->index('FK_7a9d4b25td2bijvdrupoxcv2m');
        });

        Schema::create('requisicaomaterial', function (Blueprint $table) {
            $table->integer('reqm_id', true);
            $table->boolean('encrypted');
            $table->dateTime('reqm_data')->nullable();
            $table->dateTime('reqm_dataAlteracao')->nullable();
            $table->dateTime('reqm_dataAprovacao')->nullable();
            $table->longText('reqm_descricao')->nullable();
            $table->string('reqm_documento')->nullable();
            $table->longText('reqm_observacoes')->nullable();
            $table->string('reqm_referencia')->nullable();
            $table->string('reqm_status')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_hliqklmlo1051ejs8cn1tmvx5');
            $table->integer('pessoa_pess_id')->nullable()->index('FK_8quo3tfx7cfk17w30t3rmg1m1');
        });

        Schema::create('resposta', function (Blueprint $table) {
            $table->integer('resp_id', true);
            $table->boolean('encrypted');
            $table->string('resp_categoria')->nullable();
            $table->longText('resp_opcao1')->nullable();
            $table->longText('resp_opcao2')->nullable();
            $table->longText('resp_opcao3')->nullable();
            $table->longText('resp_opcao4')->nullable();
            $table->longText('resp_pergunta')->nullable();
            $table->double('resp_pontuacao');
            $table->longText('resp_resposta')->nullable();
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_efvyvoswphpmjlxn4lsmvdqlb');
            $table->integer('curso_curs_id')->nullable()->index('FK_2q2weqltc8r1nrok80c1ydqq8');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_mymag3ipaad3ocoat8eqjns87');
            $table->integer('entidade_enti_id')->nullable()->index('FK_meoamw39mpd1o6sp7m1dlu0bv');
        });

        Schema::create('sala', function (Blueprint $table) {
            $table->integer('sala_id', true);
            $table->boolean('encrypted');
            $table->dateTime('sala_data')->nullable();
            $table->string('sala_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_rc1qvyjvnfrjmk8p4ah0x0xmg');
            $table->integer('escola_esc_id')->nullable()->index('FK_oufefojirb3860t33r740oybr');
        });

        Schema::create('salaexame', function (Blueprint $table) {
            $table->integer('salae_id', true);
            $table->dateTime('salae_data')->nullable();
            $table->integer('salae_maxAlunos');
            $table->integer('salae_ocupado');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_5ad0wnuqph8a86784s2pm84i');
            $table->integer('curso_curs_id')->nullable()->index('FK_nc03gbvb75hx9xbnk1m3jtrk6');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_s2i6fb0xh6ojc5enpuqp9wi5r');
            $table->integer('entidade_enti_id')->nullable()->index('FK_fc2836km5gbcc23k0blkbwl4o');
            $table->integer('juri1_doce_id')->nullable()->index('FK_oo7etj1ejw11gwldvussvspho');
            $table->integer('juri2_doce_id')->nullable()->index('FK_8wcs069go81f4why9bukdw7yl');
            $table->integer('sala_sala_id')->nullable()->index('FK_lp8rrivbnydsgmq6lqq1toer1');
        });

        Schema::create('sector', function (Blueprint $table) {
            $table->integer('sec_id', true);
            $table->boolean('encrypted');
            $table->string('sec_nome')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_9svfi4tow0gol9ux1d12rgxqy');
            $table->integer('departamento_dep_id')->nullable()->index('FK_stiowgwspplgtscn7wxteio8r');
        });

        Schema::create('segmento', function (Blueprint $table) {
            $table->integer('seg_id', true);
            $table->boolean('encrypted');
            $table->string('seg_categoria')->nullable();
            $table->string('seg_descricao')->nullable();
            $table->integer('seg_numero');
            $table->integer('entidade_enti_id')->nullable()->index('FK_nake4dksuegpookjkt7yi7bk2');
        });

        Schema::create('servico', function (Blueprint $table) {
            $table->integer('serv_id', true);
            $table->boolean('encrypted');
            $table->string('serv_descricao')->nullable();
            $table->string('serv_informacoes')->nullable();
            $table->double('serv_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_4achjjr0xbks5n9k1wbkbrued');
            $table->integer('horariohora_hora_id')->nullable()->index('FK_axqvf43v4v6i1mbm6aphcm851');
        });

        Schema::create('servicovendido', function (Blueprint $table) {
            $table->integer('srv_id', true);
            $table->boolean('encrypted');
            $table->double('srv_desconto');
            $table->integer('srv_qtd');
            $table->double('srv_total');
            $table->integer('entidade_enti_id')->nullable()->index('FK_eij7ug2pvmknod4fnfas1x2wd');
            $table->integer('factura_fact_id')->nullable()->index('FK_oq1uxe1boyqak2jmaulagu563');
            $table->integer('servico_serv_id')->nullable()->index('FK_syb43bc82t8yjtpkjlb2d0lsw');
        });

        Schema::create('sistema', function (Blueprint $table) {
            $table->integer('sist_id', true);
            $table->boolean('encrypted');
            $table->string('sist_descricao')->nullable();
            $table->boolean('sist_estado');
            $table->string('sist_url')->nullable();
        });

        Schema::create('sumario', function (Blueprint $table) {
            $table->integer('suma_id', true);
            $table->boolean('encrypted');
            $table->longText('suma_avaliacao')->nullable();
            $table->longText('suma_bibliografia')->nullable();
            $table->dateTime('suma_data')->nullable();
            $table->longText('suma_descricao')->nullable();
            $table->longText('suma_metodologia')->nullable();
            $table->longText('suma_objectivo')->nullable();
            $table->longText('suma_recursos')->nullable();
            $table->longText('suma_resumo')->nullable();
            $table->integer('curso_curs_id')->nullable()->index('FK_oecbiu66b904ef74s061oxqpb');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_2w0wkbh7ep11riawie9i7bpim');
            $table->integer('entidade_enti_id')->nullable()->index('FK_erkiyr7cye2qv80t10qrjhn9e');
            $table->integer('escola_esc_id')->nullable()->index('FK_2ye3jt4ejmc3bx0p8u58vobq7');
            $table->integer('tema_tema_id')->nullable()->index('FK_j66ial8ufj23ubel985dv03ne');
        });

        Schema::create('tamanho', function (Blueprint $table) {
            $table->integer('tam_id', true);
            $table->boolean('encrypted');
            $table->string('tam_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_408o2i3odp2h524j7iteb3cw6');
        });

        Schema::create('taxa', function (Blueprint $table) {
            $table->integer('taxa_id', true);
            $table->boolean('encrypted');
            $table->string('taxa_descricao')->nullable();
            $table->double('taxa_valor');
            $table->integer('entidade_enti_id')->nullable()->index('FK_tg5ij935hkthgihs7v7uou4al');
        });

        Schema::create('tema', function (Blueprint $table) {
            $table->integer('tema_id', true);
            $table->boolean('encrypted');
            $table->longText('tema_descricao')->nullable();
            $table->integer('tema_pratica');
            $table->integer('tema_teorica');
            $table->integer('curso_curs_id')->nullable()->index('FK_q6awj9i9f0vena7vmnqvfa8q8');
            $table->integer('disciplina_disc_id')->nullable()->index('FK_433hyqi59ej4b18urfh55ibwc');
            $table->integer('entidade_enti_id')->nullable()->index('FK_wvu5tm95abblay70mpfsd0tw');
            $table->integer('escola_esc_id')->nullable()->index('FK_mwlxog9vafn3tnjspa8b2wqua');
        });

        Schema::create('tipoconta', function (Blueprint $table) {
            $table->integer('tip_id', true);
            $table->boolean('encrypted');
            $table->string('tip_nome')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_2swysbcfpbq0kyrvrhk8l9o99');
        });

        Schema::create('tipocontacto', function (Blueprint $table) {
            $table->integer('tipc_id', true);
            $table->boolean('encrypted');
            $table->string('tipc_nome')->nullable();
        });

        Schema::create('tipodespesa', function (Blueprint $table) {
            $table->integer('tipd_id', true);
            $table->boolean('encrypted');
            $table->string('tipd_categoria')->nullable();
            $table->string('tipd_descricao')->nullable();
            $table->integer('tipd_numDespesas');
            $table->string('tipd_periodo')->nullable();
            $table->integer('tipd_tempo');
            $table->double('tipd_valorExectuado');
            $table->double('tipd_valorPlanificado');
            $table->integer('Entidade_enti_id')->nullable()->index('FK_n8cv7fhwx682504n7e84s1abm');
        });

        Schema::create('tipomovimentocheque', function (Blueprint $table) {
            $table->integer('tmc_id', true);
            $table->boolean('encrypted');
            $table->string('tmc_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_ffn2ll5h290u1vo473qdxk1r8');
        });

        Schema::create('tipopagamento', function (Blueprint $table) {
            $table->integer('tipa_id', true);
            $table->boolean('encrypted');
            $table->string('tipa_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_8hq7mqd70c8y7irqiyp4corde');
        });

        Schema::create('tiposervico', function (Blueprint $table) {
            $table->integer('tps_id', true);
            $table->boolean('encrypted');
            $table->string('tps_descricao')->nullable();
            $table->boolean('tps_igonoraTonelagem');
            $table->integer('entidade_enti_id')->nullable()->index('FK_es4rf2ptocmkdl7ug04x7qwn9');
        });

        Schema::create('tipousuario', function (Blueprint $table) {
            $table->integer('tipu_id', true);
            $table->boolean('encrypted');
            $table->string('tipu_descricao')->nullable();
            $table->integer('nivelAcessoniva_niva_id')->nullable()->index('FK_e5h1x62vnbq7ts4geevumdr29');
        });

        Schema::create('transferencia', function (Blueprint $table) {
            $table->integer('trans_id', true);
            $table->dateTime('trans_data')->nullable();
            $table->string('trans_status')->nullable();
            $table->integer('aluno_alun_id')->nullable()->index('FK_6syssbmsi1avt5xd5o40cpan6');
            $table->integer('entidade_enti_id')->nullable()->index('FK_5xjx6fhh1fg1ma2jlfdwcxttp');
            $table->integer('entidade2_enti_id')->nullable()->index('FK_lhm6etrpb1kh7qlifece1fd1y');
        });

        Schema::create('trial', function (Blueprint $table) {
            $table->integer('tria_id', true);
            $table->dateTime('tria_fimTrial')->nullable();
            $table->dateTime('tria_inicioTrial')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_2pi6vfkw2ux50mxrqpqotsc1f');
            $table->integer('sistema_sist_id')->nullable()->index('FK_6o75t58ve3g3lmc53y8uo2arl');
        });

        Schema::create('turma', function (Blueprint $table) {
            $table->integer('turm_id', true);
            $table->boolean('encrypted');
            $table->dateTime('turm_dataFim')->nullable();
            $table->dateTime('turm_dataInicio')->nullable();
            $table->string('turm_descricao')->nullable();
            $table->string('turm_horario')->nullable();
            $table->integer('turm_maxEstudantes');
            $table->integer('turm_minEstudantes');
            $table->integer('turm_numOcupado');
            $table->string('turm_referencia')->nullable();
            $table->string('turm_turno')->nullable();
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_bjtfwyhokopn8tmrlagm7g9u5');
            $table->integer('curso_curs_id')->nullable()->index('FK_f0slo7hicixq14ep3d30x3ncn');
            $table->integer('entidade_enti_id')->nullable()->index('FK_elqbpy4e3ei8gxuwmd600mlnm');
            $table->integer('escola_esc_id')->nullable()->index('FK_5qqkdoye2cw1blidt4815bg4i');
            $table->integer('sala_sala_id')->nullable()->index('FK_r1eadv9h70hlo5gaeci57t604');
        });

        Schema::create('turno', function (Blueprint $table) {
            $table->integer('turn_id', true);
            $table->boolean('encrypted');
            $table->string('turn_descricao')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_na73qssrt3o6lgh71qb320qie');
        });

        Schema::create('upload', function (Blueprint $table) {
            $table->integer('upl_id', true);
            $table->longText('upl_file')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_td1bqjvx66r3n02u7e5p8w957');
        });

        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->boolean('admin')->default(false);
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });

        Schema::create('usuario', function (Blueprint $table) {
            $table->integer('usua_id', true);
            $table->boolean('encrypted');
            $table->dateTime('usu_dataUltimaVisita')->nullable();
            $table->string('usua_codigoRegistro')->nullable();
            $table->dateTime('usua_dataValidade')->nullable();
            $table->string('usua_device')->nullable();
            $table->string('usua_distrito')->nullable();
            $table->string('usua_estado')->nullable();
            $table->string('usua_fotoperfil')->nullable();
            $table->string('usua_online')->nullable();
            $table->string('usua_perguntaSeguranca')->nullable();
            $table->boolean('usua_presenca');
            $table->string('usua_provincia')->nullable();
            $table->string('usua_respostaSeguranca')->nullable();
            $table->string('usua_senha')->nullable();
            $table->string('usua_status')->nullable();
            $table->string('usua_statusicon')->nullable();
            $table->integer('usua_tentativasLogin')->nullable();
            $table->string('usua_ultimasPasswords')->nullable();
            $table->string('usua_usuario')->nullable();
            $table->integer('entidade_enti_id')->nullable()->index('FK_5a5bibnjilke4mr7nkrmjticp');
            $table->integer('escola_esc_id')->nullable()->index('FK_7w82doj5vwuciq058t64vhhnc');
            $table->integer('pessoapess_pess_id')->nullable()->index('FK_68hgfkgf5x972ri2g7r4qsobw');
            $table->integer('tipoUsuariotipu_tipu_id')->nullable()->index('FK_edswmmi93y1eqnhfl9n4ecl4h');
        });

        Schema::create('vagas', function (Blueprint $table) {
            $table->integer('vaga_id', true);
            $table->boolean('encrypted');
            $table->integer('vaga_preechidas');
            $table->integer('vaga_total');
            $table->integer('anoLectivo_anol_id')->nullable()->index('FK_bvb17gjdvwvbvoeidoj2lxb5x');
            $table->integer('curso_curs_id')->nullable()->index('FK_imyyp6nj14hwetb2ug3fqf714');
            $table->integer('entidade_enti_id')->nullable()->index('FK_9la7tk47w1r4nd1gwd9kh7fd6');
        });

        Schema::create('venda', function (Blueprint $table) {
            $table->integer('vend_id', true);
            $table->boolean('encrypted');
            $table->dateTime('vend_dataVenda')->nullable();
            $table->string('vend_descricao')->nullable();
            $table->string('vend_estado')->nullable();
            $table->string('vend_referencia')->nullable();
            $table->integer('Entidade_enti_id')->nullable()->index('FK_4d1gvvw6bq6yprwe5y6b2b2ws');
            $table->integer('cliente_clie_id')->nullable()->index('FK_ixrflhygeck3m49e55lrm4j3b');
        });

        Schema::table('acta', function (Blueprint $table) {
            $table->foreign(['convocatoria_conv_id'], 'FK_jdk8fs8ddg0l1audjacebf9ni')->references(['conv_id'])->on('convocatoria');
            $table->foreign(['escola_esc_id'], 'FK_ikxryj1skdd6myt9vg56s3l3p')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_rdggjixm1br6m0q43qppai9ec')->references(['enti_id'])->on('entidade');
        });

        Schema::table('activo', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_rp47hp38awi1fpqoc4ebmp5qp')->references(['enti_id'])->on('entidade');
            $table->foreign(['fornecedor_for_id'], 'FK_c7i9rp55yxtixj2ofssn83vne')->references(['for_id'])->on('fornecedor');
        });

        Schema::table('adenda', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_m0wbiuqlirtddf0q9dkorb72')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario3_usua_id'], 'FK_752xlf1p4w319pbpnkrdn3yi1')->references(['usua_id'])->on('usuario');
            $table->foreign(['contrato_cont_id'], 'FK_kanbae4v9j5ibqvb289ghlyh3')->references(['cont_id'])->on('contrato');
            $table->foreign(['entidade_enti_id'], 'FK_1dcxp4uiuydwbouseceykbg9i')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario2_usua_id'], 'FK_fuf7gv7dx8a2qmym7cgcsvsuq')->references(['usua_id'])->on('usuario');
        });

        Schema::table('administracao', function (Blueprint $table) {
            $table->foreign(['empresa_enti_id'], 'FK_aew1eoj0u4en2ssyeipyc74g0')->references(['enti_id'])->on('entidade');
        });

        Schema::table('agenda', function (Blueprint $table) {
            $table->foreign(['anoLectivo_anol_id'], 'FK_3gi8xqmtd9khgc1scftmi992q')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['disciplina_disc_id'], 'FK_ondexcxujgssi7jgwix1ttsi')->references(['disc_id'])->on('disciplina');
            $table->foreign(['turma_turm_id'], 'FK_2emmtpsc80b2xtsm4cs5qrh7v')->references(['turm_id'])->on('turma');
            $table->foreign(['entidade_enti_id'], 'FK_7ysi2nb4tddwb49y2h2qtlwex')->references(['enti_id'])->on('entidade');
        });

        Schema::table('agendacontacto', function (Blueprint $table) {
            $table->foreign(['tipoContacto_tipc_id'], 'FK_o1pybgirwo21hn32lt6pyyi3j')->references(['tipc_id'])->on('tipocontacto');
            $table->foreign(['funcionario_func_id'], 'FK_58w7bp1psw78epuvw8s7kii18')->references(['func_id'])->on('funcionario');
            $table->foreign(['fornecedor_for_id'], 'FK_e4pp2pqoiae206duif7dwtkt3')->references(['for_id'])->on('fornecedor');
            $table->foreign(['cliente_clie_id'], 'FK_20t05635ee2d1ao4et3olhg3m')->references(['clie_id'])->on('cliente');
            $table->foreign(['entidade_enti_id'], 'FK_dalbjoormil0teywq3qq9dqvk')->references(['enti_id'])->on('entidade');
        });

        Schema::table('aluno', function (Blueprint $table) {
            $table->foreign(['escola_esc_id'], 'FK_8lki430ac35iaf284bhyll6xj')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_kbjdu10dy3f1mmvnruhhnbmbi')->references(['enti_id'])->on('entidade');
            $table->foreign(['turma_turm_id'], 'FK_7dkxvmvikn17q78r35w1odj7q')->references(['turm_id'])->on('turma');
            $table->foreign(['pessoa_pess_id'], 'FK_ai5syhs7i5hit0uifd43a4qje')->references(['pess_id'])->on('pessoa');
        });

        Schema::table('anolectivo', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_frxat7s9w6gnsrjfp5xy1av0b')->references(['enti_id'])->on('entidade');
        });

        Schema::table('area', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_5y4xdnrg1vra75xtn1hc8s8cj')->references(['enti_id'])->on('entidade');
        });

        Schema::table('areaformacao', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_4w1f237uce4cil3kbi8851nvx')->references(['enti_id'])->on('entidade');
        });

        Schema::table('assiduidade', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_taej257uv67ps6ht9rdou3s45')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoa_pess_id'], 'FK_knqx8leyqvxp3an5btor1s5sw')->references(['pess_id'])->on('pessoa');
        });

        Schema::table('avaliacao', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_mcyawqa1dsvq17stmpkitaet4')->references(['enti_id'])->on('entidade');
            $table->foreign(['aluno_alun_id'], 'FK_avqgkwb66f9siw8injhgo9nhl')->references(['alun_id'])->on('aluno');
        });

        Schema::table('banco', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_47jyd7i2oqfr8g2w6320q8ujh')->references(['enti_id'])->on('entidade');
        });

        Schema::table('boletim', function (Blueprint $table) {
            $table->foreign(['inscricao_insc_id'], 'FK_om82qwj8rf5r3grbk5so4yxd8')->references(['insc_id'])->on('inscricao');
            $table->foreign(['entidade_enti_id'], 'FK_86y8cp7luvxmoq2mnrfqw7ivf')->references(['enti_id'])->on('entidade');
        });

        Schema::table('browser', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_nf9r0bemspgneg8ixbm91f98r')->references(['usua_id'])->on('usuario');
        });

        Schema::table('caixa', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_84bo5166rmesb0lo963phjpq5')->references(['usua_id'])->on('usuario');
            $table->foreign(['departamento_dep_id'], 'FK_2mu894nt40t16ldsyngkbgdiq')->references(['dep_id'])->on('departamento');
            $table->foreign(['entidade_enti_id'], 'FK_nltlbgf39bw31uim62xof7xom')->references(['enti_id'])->on('entidade');
        });

        Schema::table('calendario', function (Blueprint $table) {
            $table->foreign(['disciplina_disc_id'], 'FK_98mxa2b9760hj8sv2187uahnh')->references(['disc_id'])->on('disciplina');
            $table->foreign(['juri4_doce_id'], 'FK_e6po33lyxud6bv0671pmpxejw')->references(['doce_id'])->on('docente');
            $table->foreign(['juri3_doce_id'], 'FK_mwds2x932u8pnkos7j8veq0oo')->references(['doce_id'])->on('docente');
            $table->foreign(['docente_doce_id'], 'FK_5g188ca99e6q7hhbpjikw6tta')->references(['doce_id'])->on('docente');
            $table->foreign(['juri2_doce_id'], 'FK_7746ft7hog9q6i39bh1m3ffvc')->references(['doce_id'])->on('docente');
            $table->foreign(['entidade_enti_id'], 'FK_9fgbiary8onfif286f2ykm8lg')->references(['enti_id'])->on('entidade');
            $table->foreign(['juri1_doce_id'], 'FK_gccsrxn9qkuasrga6x1v4obmr')->references(['doce_id'])->on('docente');
            $table->foreign(['anoLectivo_anol_id'], 'FK_32uujplvdhlrg5oa979oq5vdu')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['curso_curs_id'], 'FK_ry23c7th8hjprj2ef7k0w52qv')->references(['curs_id'])->on('curso');
            $table->foreign(['turma_turm_id'], 'FK_74odnvyv7w55sfw52tffsoqlw')->references(['turm_id'])->on('turma');
        });

        Schema::table('calendarioexame', function (Blueprint $table) {
            $table->foreign(['anoLectivo_anol_id'], 'FK_rvd5vqdpebu392hsuw6bmismo')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['disciplina_disc_id'], 'FK_wuumfdmtmy08penr2x2gsvnf')->references(['disc_id'])->on('disciplina');
            $table->foreign(['entidade_enti_id'], 'FK_3x7p6epyknjn2jfceuqjcgvi7')->references(['enti_id'])->on('entidade');
            $table->foreign(['curso_curs_id'], 'FK_ucqb3a5culx0xu4gbmv07eta')->references(['curs_id'])->on('curso');
        });

        Schema::table('cargo', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_om59n1p8simtxunk78xsc7v65')->references(['enti_id'])->on('entidade');
        });

        Schema::table('categoria', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_i3x8qikv8e5w53bslwwe5app5')->references(['enti_id'])->on('entidade');
        });

        Schema::table('categoriaproduto', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_56q3cja2toqw8xna7maeddhox')->references(['enti_id'])->on('entidade');
        });

        Schema::table('cliente', function (Blueprint $table) {
            $table->foreign(['pessoapess_pess_id'], 'FK_3d8yf1m8qy81ovurrtetgubve')->references(['pess_id'])->on('pessoa');
            $table->foreign(['Entidade_enti_id'], 'FK_10brqolm3gt59gcakn2o146u0')->references(['enti_id'])->on('entidade');
        });

        Schema::table('codigo', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_9jcxm9npbsq43k8s73ovjdb48')->references(['enti_id'])->on('entidade');
        });

        Schema::table('condicaopagamento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_jd8q8vknvxr8bglmvepxv6j6d')->references(['enti_id'])->on('entidade');
        });

        Schema::table('conta', function (Blueprint $table) {
            $table->foreign(['cliente_clie_id'], 'FK_nex8koc1uo9mlnrdfjcguwjw9')->references(['clie_id'])->on('cliente');
            $table->foreign(['tipoConta_tip_id'], 'FK_asdv8b3rjfjtilsw5hftw7eoe')->references(['tip_id'])->on('tipoconta');
            $table->foreign(['entidade_enti_id'], 'FK_sjijacd720ikrpj8citoj25e5')->references(['enti_id'])->on('entidade');
        });

        Schema::table('contacorrente', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_70irf027dlsm901xfflndo8m1')->references(['usua_id'])->on('usuario');
            $table->foreign(['cliente_clie_id'], 'FK_14l1faakxfivcksjppmw695x4')->references(['clie_id'])->on('cliente');
            $table->foreign(['entidade_enti_id'], 'FK_pnihc8swojf73k4mvlu7bnsm4')->references(['enti_id'])->on('entidade');
        });

        Schema::table('contageral', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_qf5yrej3obl5admbo3k1c50gu')->references(['enti_id'])->on('entidade');
        });

        Schema::table('contracto', function (Blueprint $table) {
            $table->foreign(['clienteclie_clie_id'], 'FK_4lts1hkl27bjgyuc7wgpksd4v')->references(['clie_id'])->on('cliente');
            $table->foreign(['servicoserv_serv_id'], 'FK_kmoo260fu7x7dxasdt7xw2s4s')->references(['serv_id'])->on('servico');
            $table->foreign(['funcionario_func_id'], 'FK_2t6gxr1ohqqabxf71yc36rh3d')->references(['func_id'])->on('funcionario');
            $table->foreign(['Entidade_enti_id'], 'FK_7one04jhrnowbxeji0ik25qo5')->references(['enti_id'])->on('entidade');
        });

        Schema::table('contrato', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_ai16kqg1fsg5a9lx2hjtm132u')->references(['enti_id'])->on('entidade');
        });

        Schema::table('convocado', function (Blueprint $table) {
            $table->foreign(['escola_esc_id'], 'FK_ajfqe71ni8lnju81afalc31t0')->references(['esc_id'])->on('escola');
            $table->foreign(['convocatoria_conv_id'], 'FK_svbwen9x84a0an3kwvqbouh5a')->references(['conv_id'])->on('convocatoria');
            $table->foreign(['entidade_enti_id'], 'FK_8xcrfflv1v2wfcm07rx97dkv7')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoa_pess_id'], 'FK_dtqf2v1wb9pyu7k811xvf0ufg')->references(['pess_id'])->on('pessoa');
        });

        Schema::table('convocatoria', function (Blueprint $table) {
            $table->foreign(['secretario_pess_id'], 'FK_t3hiysasu59vo0q8dkbxwqtji')->references(['pess_id'])->on('pessoa');
            $table->foreign(['presidente_pess_id'], 'FK_e0xt4d8ncvmnwlychpy9ly9tw')->references(['pess_id'])->on('pessoa');
            $table->foreign(['sala_sala_id'], 'FK_hh963dw5wk8duqwvdx0r5h0t0')->references(['sala_id'])->on('sala');
            $table->foreign(['escola_esc_id'], 'FK_apoof1bkue143pkqin5kwwx4y')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_gkdc0jlmd4xm2xgp62eivb0rb')->references(['enti_id'])->on('entidade');
        });

        Schema::table('curso', function (Blueprint $table) {
            $table->foreign(['areaFormacao_aref_id'], 'FK_bkd5vu4xxqy225d2o6xnlgq8a')->references(['aref_id'])->on('areaformacao');
            $table->foreign(['entidade_enti_id'], 'FK_5oh9yrcu7v3hvcwfbs14acxrg')->references(['enti_id'])->on('entidade');
        });

        Schema::table('departamento', function (Blueprint $table) {
            $table->foreign(['administracao_adm_id'], 'FK_eejspavkwhwuak1pq2uu3nssi')->references(['adm_id'])->on('administracao');
            $table->foreign(['Entidade_enti_id'], 'FK_a756kbm4bsk6qrt6xhapj7l30')->references(['enti_id'])->on('entidade');
            $table->foreign(['nivelPrioridade_nvp_id'], 'FK_ntecai3lm5d1sa3ayu7ti3yo6')->references(['nvp_id'])->on('nivelprioridade');
        });

        Schema::table('dependente', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_7qbhfckctc3jpv2acc94d8eco')->references(['func_id'])->on('funcionario');
            $table->foreign(['Entidade_enti_id'], 'FK_24wnkht2g6i5k24m07kxyd2ug')->references(['enti_id'])->on('entidade');
        });

        Schema::table('despesa', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_jhsaoifwu41688cg6seyh6ybr')->references(['usua_id'])->on('usuario');
            $table->foreign(['Entidade_enti_id'], 'FK_ix6fw0l8nm6vwwdxgs9s12wi1')->references(['enti_id'])->on('entidade');
            $table->foreign(['tipoDespesa_tipd_id'], 'FK_ob59rwsh7ee50cnugp7xckkri')->references(['tipd_id'])->on('tipodespesa');
        });

        Schema::table('diario', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_johda3lae471pitwiv31dewhg')->references(['enti_id'])->on('entidade');
        });

        Schema::table('disciplina', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_grsg69oau24l68e1anxnohfow')->references(['enti_id'])->on('entidade');
        });

        Schema::table('disciplinacurso', function (Blueprint $table) {
            $table->foreign(['disciplina_disc_id'], 'FK_m28yaqqphd17gldaxbdhx0s6o')->references(['disc_id'])->on('disciplina');
            $table->foreign(['curso_curs_id'], 'FK_6kwg61ee7c432fakqmn6mjmw0')->references(['curs_id'])->on('curso');
            $table->foreign(['entidade_enti_id'], 'FK_qihsrlaipmg9xxtkwssw8m6bk')->references(['enti_id'])->on('entidade');
        });

        Schema::table('disciplinadocente', function (Blueprint $table) {
            $table->foreign(['docente_doce_id'], 'FK_a3myhb0nm58vso67pghet6h1')->references(['doce_id'])->on('docente');
            $table->foreign(['entidade_enti_id'], 'FK_4hio7nrflk1nhjkrjanf6ncvv')->references(['enti_id'])->on('entidade');
            $table->foreign(['disciplina_disc_id'], 'FK_kg4evqx1x2qw882martam55or')->references(['disc_id'])->on('disciplina');
        });

        Schema::table('doc', function (Blueprint $table) {
            $table->foreign(['usuario3_usua_id'], 'FK_lho08pgudxfeu30j095lhmu71')->references(['usua_id'])->on('usuario');
            $table->foreign(['codigo_cod_id'], 'FK_tjdx0op0bm45fprc5ay9jkyaa')->references(['cod_id'])->on('codigo');
            $table->foreign(['usuario2_usua_id'], 'FK_5o947e57pp40bdkpy1y3cdq08')->references(['usua_id'])->on('usuario');
            $table->foreign(['escola_esc_id'], 'FK_ldeks5i11tw7bqgs0m2v95lw0')->references(['esc_id'])->on('escola');
            $table->foreign(['usuario_usua_id'], 'FK_qr4ly0f28e1x76b7jjitigub2')->references(['usua_id'])->on('usuario');
            $table->foreign(['departamento_dep_id'], 'FK_4qtl42972kex8o60r6voski7k')->references(['dep_id'])->on('departamento');
            $table->foreign(['entidade_enti_id'], 'FK_dhlomryq5ayjbncd0miomx8dy')->references(['enti_id'])->on('entidade');
        });

        Schema::table('docente', function (Blueprint $table) {
            $table->foreign(['areaFormacao_aref_id'], 'FK_ataa0n6q7saq8j56lf0toywre')->references(['aref_id'])->on('areaformacao');
            $table->foreign(['entidade_enti_id'], 'FK_43lkif5xlit28rml5m1tdgr5a')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoa_pess_id'], 'FK_qn8muyudxkb50x3vpnebqkrwi')->references(['pess_id'])->on('pessoa');
        });

        Schema::table('docenteturma', function (Blueprint $table) {
            $table->foreign(['turma_turm_id'], 'FK_l8u5pwbh9neqhp3ku2gftjheb')->references(['turm_id'])->on('turma');
            $table->foreign(['docente_doce_id'], 'FK_2lwqcfjywgpyj3wbhl1nsx6f0')->references(['doce_id'])->on('docente');
            $table->foreign(['entidade_enti_id'], 'FK_q14kouux2noty67ph80ihj8r4')->references(['enti_id'])->on('entidade');
        });

        Schema::table('documento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_kmtl648ennkv78qmqmk4xa46u')->references(['enti_id'])->on('entidade');
            $table->foreign(['entidade_enti_id'], 'FK_7nn20ephejebgdiqa7nefaggt')->references(['enti_id'])->on('entidade');
        });

        Schema::table('exame', function (Blueprint $table) {
            $table->foreign(['inscricao_insc_id'], 'FK_hypknfacmlg2muescafsxjx0y')->references(['insc_id'])->on('inscricao');
            $table->foreign(['salaExame_salae_id'], 'FK_6yr3292ylfg9uues9k28edlrf')->references(['salae_id'])->on('salaexame');
            $table->foreign(['entidade_enti_id'], 'FK_ao14u1oumwx3su9r6f3mg3tca')->references(['enti_id'])->on('entidade');
            $table->foreign(['anoLectivo_anol_id'], 'FK_ohlqhdvrnddsfac8yrvrj6k8h')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['disciplina_disc_id'], 'FK_6cn7ybgwypslpusof4jfmafr5')->references(['disc_id'])->on('disciplina');
            $table->foreign(['aluno_alun_id'], 'FK_7fp9b02gfuj5ihrpned1qdie5')->references(['alun_id'])->on('aluno');
        });

        Schema::table('extracto', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_ccf1yuw773xr9tltok1h48hf')->references(['enti_id'])->on('entidade');
            $table->foreign(['factura_fact_id'], 'FK_a4mmrye6vdk99babdgo11611r')->references(['fact_id'])->on('factura');
        });

        Schema::table('extractocontageral', function (Blueprint $table) {
            $table->foreign(['lancamento_lan_id'], 'FK_k358qt33e6loreuv1jnmnncib')->references(['lan_id'])->on('lancamento');
            $table->foreign(['contaGeral_ctg_id'], 'FK_19gkfusc1nfoicys516judg7m')->references(['ctg_id'])->on('contageral');
            $table->foreign(['entidade_enti_id'], 'FK_k4i70e28jhu9nia1xn6bjhc6j')->references(['enti_id'])->on('entidade');
        });

        Schema::table('factura', function (Blueprint $table) {
            $table->foreign(['moeda_moe_id'], 'FK_f2ubmtdurx6mjqagc9ibcab8d')->references(['moe_id'])->on('moeda');
            $table->foreign(['Entidade_enti_id'], 'FK_l9cu83u86jv7swv2sayt2066h')->references(['enti_id'])->on('entidade');
            $table->foreign(['documento_doc_id'], 'FK_3hvhu0mt8vrm460rsarcjgn9d')->references(['doc_id'])->on('documento');
            $table->foreign(['caixa_caix_id'], 'FK_btj7lhcqrg4kcqtq1nn9x0d6w')->references(['caix_id'])->on('caixa');
            $table->foreign(['venda_vend_id'], 'FK_h7f67f4gdqlmkc705e397fy8a')->references(['vend_id'])->on('venda');
            $table->foreign(['conta_ctg_id'], 'FK_n9q1itic7w1m80i9fksj1f7ed')->references(['ctg_id'])->on('contageral');
            $table->foreign(['pagamento_pag_id'], 'FK_158uv0y880xxre18kwkayp4lp')->references(['pag_id'])->on('pagamento');
            $table->foreign(['usuario_usua_id'], 'FK_a70gyxw3dru3i5yrb6k17e9xq')->references(['usua_id'])->on('usuario');
        });

        Schema::table('faltas', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_s4jc3autodujjf41a380ejil8')->references(['func_id'])->on('funcionario');
            $table->foreign(['Entidade_enti_id'], 'FK_hqjkt4f6b6kuyihe43fh2ok4v')->references(['enti_id'])->on('entidade');
        });

        Schema::table('fecho', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_j2jny3mpptg4l9eb65ydhgrt7')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario_usua_id'], 'FK_a2pypwlps868k2h25ijd3x4c9')->references(['usua_id'])->on('usuario');
        });

        Schema::table('ferias', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_kud22pc3xtvpc82tvof058f05')->references(['enti_id'])->on('entidade');
            $table->foreign(['funcionario_func_id'], 'FK_7ogq58mmtmp7gx5g142ds318k')->references(['func_id'])->on('funcionario');
        });

        Schema::table('firma', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_d5jmo64oggci0jrax2wwci3qx')->references(['enti_id'])->on('entidade');
        });

        Schema::table('fluxo', function (Blueprint $table) {
            $table->foreign(['factura_fact_id'], 'FK_rx18ia004wj6jp8urmvwfsgkk')->references(['fact_id'])->on('factura');
            $table->foreign(['entidade_enti_id'], 'FK_932fvs2xhjy0ebqf552vry3c8')->references(['enti_id'])->on('entidade');
            $table->foreign(['produto_pro_id'], 'FK_oq56wted8d2j7ltb1u1bjfvon')->references(['pro_id'])->on('produto');
            $table->foreign(['turma_turm_id'], 'FK_rxxvlgty2vwtusi5mlulpppfe')->references(['turm_id'])->on('turma');
            $table->foreign(['cliente_clie_id'], 'FK_1yk8x0ntt12sso9u5yfnei4gf')->references(['clie_id'])->on('cliente');
            $table->foreign(['usuario_usua_id'], 'FK_9888de7hay47qg0yhagmnx41')->references(['usua_id'])->on('usuario');
        });

        Schema::table('folhasalarial', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_53fqtis9ydqbgfg7gtge9afxl')->references(['enti_id'])->on('entidade');
            $table->foreign(['funcionario_func_id'], 'FK_4s3mlynr6yl3p8bxo09c4wgwx')->references(['func_id'])->on('funcionario');
        });

        Schema::table('formacao', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_p83i1d8a2jqrag3wv0hwjedrj')->references(['func_id'])->on('funcionario');
            $table->foreign(['Entidade_enti_id'], 'FK_gik3tgutl9uodaf2q94scyv3g')->references(['enti_id'])->on('entidade');
        });

        Schema::table('formulario', function (Blueprint $table) {
            $table->foreign(['sistema_sist_id'], 'FK_oax4s6ao8ok58c0a14xdkh5ll')->references(['sist_id'])->on('sistema');
        });

        Schema::table('formulariosusuario', function (Blueprint $table) {
            $table->foreign(['formulario_form_id'], 'FK_qedv1256qr19185d74h659puh')->references(['form_id'])->on('formulario');
            $table->foreign(['moduloUsuario_modu_id'], 'FK_akknnmwc7s8jbcgiwk7ffkjpg')->references(['modu_id'])->on('modulousuario');
        });

        Schema::table('fornecedor', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_htg20ra8oqcm3h9gc5vr4uybj')->references(['enti_id'])->on('entidade');
        });

        Schema::table('funcionario', function (Blueprint $table) {
            $table->foreign(['pessoapess_pess_id'], 'FK_gvnobskteqgnk8i1tf3e80bqy')->references(['pess_id'])->on('pessoa');
            $table->foreign(['firmafirm_firm_id'], 'FK_7iig7u2dakc9dqvtqfako35rv')->references(['firm_id'])->on('firma');
            $table->foreign(['Entidade_enti_id'], 'FK_asduo33c7kpj1pu8m53bgo21k')->references(['enti_id'])->on('entidade');
            $table->foreign(['habilitacao_habi_id'], 'FK_mm6nma58ue2cyv16pqjr7j0gb')->references(['habi_id'])->on('habilitacao');
            $table->foreign(['departamento_dep_id'], 'FK_7enln7j79flqeno2m1akdtvib')->references(['dep_id'])->on('departamento');
            $table->foreign(['cargo_car_id'], 'FK_8hbn26lkhmttkvj53456jqinf')->references(['car_id'])->on('cargo');
        });

        Schema::table('guiaremessa', function (Blueprint $table) {
            $table->foreign(['factura_fact_id'], 'FK_l4exrkq98om6k1mhr9k688uls')->references(['fact_id'])->on('factura');
            $table->foreign(['usuario2_usua_id'], 'FK_3pa1ddgb0c6u7r5o3jcpn7jw9')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario_usua_id'], 'FK_l40btg65x6s39xpu7f6q3ojsq')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_o9jkf50bybenc11pbgs2wofgs')->references(['enti_id'])->on('entidade');
            $table->foreign(['cliente_clie_id'], 'FK_2ccv55iw83bna0crobsh1xcxw')->references(['clie_id'])->on('cliente');
            $table->foreign(['fornecedor_for_id'], 'FK_fgm9y04ssd5yjyvd3r8e9kcog')->references(['for_id'])->on('fornecedor');
        });

        Schema::table('habilitacao', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_mpwhy6rc2ob5q7q5ksors7ij4')->references(['enti_id'])->on('entidade');
        });

        Schema::table('horario', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_dw45ijcfdjf3ejgtagpfnun3q')->references(['enti_id'])->on('entidade');
        });

        Schema::table('horas', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_dib40nsrei872umfjtkxdh23c')->references(['enti_id'])->on('entidade');
            $table->foreign(['funcionario_func_id'], 'FK_283l5evl1uv8otjdkda4nl4w1')->references(['func_id'])->on('funcionario');
        });

        Schema::table('inscricao', function (Blueprint $table) {
            $table->foreign(['aluno_alun_id'], 'FK_s1nuxyfeo8b80m8ni7by9kikr')->references(['alun_id'])->on('aluno');
            $table->foreign(['anoLectivo_anol_id'], 'FK_9erfl299rv2wy5n2cp0fn9ks0')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['curso_curs_id'], 'FK_gx178uqpqdb0i87lukjifj3nl')->references(['curs_id'])->on('curso');
            $table->foreign(['turno_turn_id'], 'FK_yuw9jl6rvbeahytnik5cgh4q')->references(['turn_id'])->on('turno');
            $table->foreign(['turma_turm_id'], 'FK_96ffud0y1ccfyvcwkq1366cn8')->references(['turm_id'])->on('turma');
            $table->foreign(['entidade_enti_id'], 'FK_bowie4p725a210no3ukjgtxxi')->references(['enti_id'])->on('entidade');
        });

        Schema::table('isencao', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_mcx522b08kyjqksylpusbuu01')->references(['enti_id'])->on('entidade');
        });

        Schema::table('itempedido', function (Blueprint $table) {
            $table->foreign(['factura_fact_id'], 'FK_gcnldac310v1ro23xsngeq89')->references(['fact_id'])->on('factura');
            $table->foreign(['guiaRemessa_guia_id'], 'FK_5gafq0bq1ce9j0mlo6436y6hk')->references(['guia_id'])->on('guiaremessa');
            $table->foreign(['entidade_enti_id'], 'FK_m6m2s7nhn25qfgodw35mi4ksr')->references(['enti_id'])->on('entidade');
        });

        Schema::table('itemrequisicao', function (Blueprint $table) {
            $table->foreign(['requisicao_req_id'], 'FK_9lp4bpu7ge71o3033i0qh1woh')->references(['req_id'])->on('requisicao');
            $table->foreign(['entidade_enti_id'], 'FK_739knyv4nj73gyrsch0pt46ay')->references(['enti_id'])->on('entidade');
        });

        Schema::table('itemrequisicaocheque', function (Blueprint $table) {
            $table->foreign(['requisicaoCheque_rqc_id'], 'FK_ewpabkfw2dqvp7tsk3cx5vnyg')->references(['rqc_id'])->on('requisicaocheque');
            $table->foreign(['entidade_enti_id'], 'FK_12197cy63f32t5lair2notisb')->references(['enti_id'])->on('entidade');
        });

        Schema::table('lancamento', function (Blueprint $table) {
            $table->foreign(['contaCliente_ctg_id'], 'FK_mprqyx6w9rr06o84bodlm3406')->references(['ctg_id'])->on('contageral');
            $table->foreign(['usuario_usua_id'], 'FK_r4j1v194l8i4ysuagvryxpjlp')->references(['usua_id'])->on('usuario');
            $table->foreign(['factura_fact_id'], 'FK_4q6hf7htlr5elu5u89juqux52')->references(['fact_id'])->on('factura');
            $table->foreign(['documento_doc_id'], 'FK_7oolibak82pjyp9pnd0o9crvx')->references(['doc_id'])->on('documento');
            $table->foreign(['entidade_enti_id'], 'FK_oyykrytdsxa69dw06x1dpus9t')->references(['enti_id'])->on('entidade');
            $table->foreign(['contaPlano_ctg_id'], 'FK_slrnvtmw8hgql7iie4yhwar21')->references(['ctg_id'])->on('contageral');
            $table->foreign(['diario_dir_id'], 'FK_2swohlsdgt8vf5eykgnxgdl3e')->references(['dir_id'])->on('diario');
            $table->foreign(['funcionario_func_id'], 'FK_67f5hhyr6l5mdaer2m1j6qdmv')->references(['func_id'])->on('funcionario');
        });

        Schema::table('lembrete', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_83e03e4682r7v5nyfl0il6kpc')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_3qtx9c5ectk7q1la7jb0vmb8d')->references(['enti_id'])->on('entidade');
        });

        Schema::table('listatelefonica', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_gmjl77s4abl5s2w1ldn62necl')->references(['enti_id'])->on('entidade');
        });

        Schema::table('log', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_53yj8pgaidsaeif40iu3ltj7k')->references(['enti_id'])->on('entidade');
            $table->foreign(['sistema_sist_id'], 'FK_17hwvurguvvlewxi4utq6fe59')->references(['sist_id'])->on('sistema');
            $table->foreign(['usuario_usua_id'], 'FK_hrw7vv9m5xq0synxuq10kmfay')->references(['usua_id'])->on('usuario');
        });

        Schema::table('media', function (Blueprint $table) {
            $table->foreign(['inscricao_insc_id'], 'FK_ie7tc2p7ppkh5r56t09ydlkfm')->references(['insc_id'])->on('inscricao');
            $table->foreign(['disciplina_disc_id'], 'FK_8c1otoe3gpk18icphq8m7swwq')->references(['disc_id'])->on('disciplina');
            $table->foreign(['turma_turm_id'], 'FK_dq9itvdjwejv4xxe58gdxckd4')->references(['turm_id'])->on('turma');
            $table->foreign(['anoLectivo_anol_id'], 'FK_syeeo0owc0kpoi63pms4jncrq')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['entidade_enti_id'], 'FK_24j3ky0oiyqrnbb6njf1hcvcj')->references(['enti_id'])->on('entidade');
            $table->foreign(['aluno_alun_id'], 'FK_a5y2kmp2d4ps55ejivqqxkq4q')->references(['alun_id'])->on('aluno');
        });

        Schema::table('meiopagamento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_8lf5vr0g0jmtxi28w4q3sotj8')->references(['enti_id'])->on('entidade');
        });

        Schema::table('mensalidade', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_55drx7a8y9d0yjxfmivwcqxqj')->references(['enti_id'])->on('entidade');
            $table->foreign(['aluno_alun_id'], 'FK_4vprncqyqt1w7rcsqd809l8so')->references(['alun_id'])->on('aluno');
            $table->foreign(['curso_curs_id'], 'FK_rq9ygnvbbk6etbp9awc9kstfu')->references(['curs_id'])->on('curso');
        });

        Schema::table('modulo', function (Blueprint $table) {
            $table->foreign(['curso_curs_id'], 'FK_adl9w4cemnv5u8vaows0dsgi4')->references(['curs_id'])->on('curso');
            $table->foreign(['entidade_enti_id'], 'FK_35wc18gb5q0mek2vgauchahr')->references(['enti_id'])->on('entidade');
        });

        Schema::table('moduloacesso', function (Blueprint $table) {
            $table->foreign(['entidadeenti_enti_id'], 'FK_ksdsgaq9vxjai8v1e06a344e1')->references(['enti_id'])->on('entidade');
            $table->foreign(['sistema_sist_id'], 'FK_jc0kkxavfkfp4f0yb1d3iyod8')->references(['sist_id'])->on('sistema');
        });

        Schema::table('modulosusuario', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_lpxi2bq9hq5esqwyk3y8vr7vh')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario_usua_id'], 'FK_5nnpix6in7o42ph0bxrxofc18')->references(['usua_id'])->on('usuario');
        });

        Schema::table('modulosusuariomarket', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_ibpxaq5rn7mikbprq7ejgmxf7')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario_usua_id'], 'FK_fn5lc3asuu38xwaddm5b79cvo')->references(['usua_id'])->on('usuario');
        });

        Schema::table('modulousuario', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_hxhp0fppiir6fjjdfk6cpig11')->references(['usua_id'])->on('usuario');
            $table->foreign(['moduloAcesso_moac_id'], 'FK_84t0hynggh54oqmn0mt2hax6o')->references(['moac_id'])->on('moduloacesso');
        });

        Schema::table('moeda', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_2rnrolstx6iaj0b4vgk0wbjd2')->references(['enti_id'])->on('entidade');
        });

        Schema::table('movimento', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_dm0ob0oesk0xfe2qmggquu371')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_16gy57vr9j4vlabrkkaf5yonr')->references(['enti_id'])->on('entidade');
            $table->foreign(['banco_bnc_id'], 'FK_r01a5wotlfpfssovpw16olj6f')->references(['bnc_id'])->on('banco');
        });

        Schema::table('nivelacesso', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_5rlfyqoopm3uj1020x77t1c8q')->references(['enti_id'])->on('entidade');
        });

        Schema::table('notas', function (Blueprint $table) {
            $table->foreign(['aluno_alun_id'], 'FK_m9xigny2j8ml20pbayewwoxa0')->references(['alun_id'])->on('aluno');
            $table->foreign(['disciplina_disc_id'], 'FK_8pfotl50da7a8bptenacyt172')->references(['disc_id'])->on('disciplina');
            $table->foreign(['turma_turm_id'], 'FK_fe3oe0fg0bqbr3s7itq7qufxc')->references(['turm_id'])->on('turma');
            $table->foreign(['anoLectivo_anol_id'], 'FK_npauu1jp16y8ynvkx1gxuyp92')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['inscricao_insc_id'], 'FK_1c8qjujjprm04lmiy71pcjrf7')->references(['insc_id'])->on('inscricao');
            $table->foreign(['entidade_enti_id'], 'FK_8tunkwvd1cb5vqhdw500mw2tm')->references(['enti_id'])->on('entidade');
        });

        Schema::table('pagamento', function (Blueprint $table) {
            $table->foreign(['reciboPagamento_recp_id'], 'FK_lyevni07eq966mcvq9mkkk25v')->references(['recp_id'])->on('recibopagamento');
            $table->foreign(['turma_turm_id'], 'FK_2npd64r3pm1bfeo5okvtkqeud')->references(['turm_id'])->on('turma');
            $table->foreign(['entidade_enti_id'], 'FK_4hjbtodk3l25mgwmf53nsg9kf')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoa_pess_id'], 'FK_peu87n5vy56271rmp1ca1n8rx')->references(['pess_id'])->on('pessoa');
            $table->foreign(['inscricao_insc_id'], 'FK_1kd8i3l96jcb8q95oo4m5chy3')->references(['insc_id'])->on('inscricao');
            $table->foreign(['caixa_caix_id'], 'FK_3idshtgvh2x3c7xqp8e28govb')->references(['caix_id'])->on('caixa');
        });

        Schema::table('parceiro', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_8xcy30fnj5f3aivlrebj77chw')->references(['enti_id'])->on('entidade');
        });

        Schema::table('pdf', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_dixllrvenrnav3xhbvxafw4k7')->references(['enti_id'])->on('entidade');
        });

        Schema::table('periodosalarial', function (Blueprint $table) {
            $table->foreign(['usuario_usua_id'], 'FK_amkgr1nuve6rn2x9l1wwidi7x')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_n86ghfraa4lntmqncj46ws0cr')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuarioVerifica_usua_id'], 'FK_9ftg9tf7g0yisx31vxp7au8jm')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuarioAutoriza_usua_id'], 'FK_g6hynq896la38h54a9ncjfbwt')->references(['usua_id'])->on('usuario');
        });

        Schema::table('pessoa', function (Blueprint $table) {
            $table->foreign(['nacionalidadenaci_naci_id'], 'FK_sgqnd7nxdd12e55k3xchh6m69')->references(['naci_id'])->on('nacionalidade');
            $table->foreign(['entidade_enti_id'], 'FK_nagwq4oa5q56x94iak41d0v3e')->references(['enti_id'])->on('entidade');
        });

        Schema::table('pety', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_iv3p9fufx82ldaso32d8ap72q')->references(['enti_id'])->on('entidade');
        });

        Schema::table('petycash', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_dk2s8208hgpkswub1mw8ijbsu')->references(['func_id'])->on('funcionario');
            $table->foreign(['entidade_enti_id'], 'FK_orvmwxycgqy4xmatsyu7gwr88')->references(['enti_id'])->on('entidade');
            $table->foreign(['usuario_usua_id'], 'FK_9m9qm0m3h894fd2ttfad9br3q')->references(['usua_id'])->on('usuario');
            $table->foreign(['pety_pety_id'], 'FK_ltkehpnnjldfkdcs956udkaph')->references(['pety_id'])->on('pety');
        });

        Schema::table('planodeconta', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_m0js5l1tb10ewts4u63mh0qre')->references(['enti_id'])->on('entidade');
            $table->foreign(['planoDeConta_pdc_id'], 'FK_jkqiofgh5a5sp15sf2h4fkwix')->references(['pdc_id'])->on('planodeconta');
        });

        Schema::table('planosaude', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_rg0xllsi66v9golf1n1pa53y')->references(['func_id'])->on('funcionario');
            $table->foreign(['Entidade_enti_id'], 'FK_9vny1fyrci8v5cdcqlwqrnovr')->references(['enti_id'])->on('entidade');
        });

        Schema::table('preco', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_giqja0oe0jkxn2qto934lj3k7')->references(['enti_id'])->on('entidade');
        });

        Schema::table('presencas', function (Blueprint $table) {
            $table->foreign(['disciplina_disc_id'], 'FK_jrbwgptv6250nuxyvpvl4wfra')->references(['disc_id'])->on('disciplina');
            $table->foreign(['entidade_enti_id'], 'FK_sdk292n9vboqcl0yhmt6kuwf3')->references(['enti_id'])->on('entidade');
            $table->foreign(['aluno_alun_id'], 'FK_1s86gw2gw3q1m1mob9nmndn4t')->references(['alun_id'])->on('aluno');
            $table->foreign(['turma_turm_id'], 'FK_o16ns9ve81vtu7xcxhuj6cmqx')->references(['turm_id'])->on('turma');
        });

        Schema::table('produto', function (Blueprint $table) {
            $table->foreign(['categoriaProduto_catp_id'], 'FK_o41y7r98r75obaqbbdc2hjl9c')->references(['catp_id'])->on('categoriaproduto');
            $table->foreign(['cor_cor_id'], 'FK_idmkj9i4kwl7u1vsk7euocw26')->references(['cor_id'])->on('cor');
            $table->foreign(['tamanho_tam_id'], 'FK_ksnpb5s9vhlw4qyet836xq14q')->references(['tam_id'])->on('tamanho');
            $table->foreign(['fornecedor_for_id'], 'FK_96q57to8p0qtfln1txppbodkj')->references(['for_id'])->on('fornecedor');
            $table->foreign(['Entidade_enti_id'], 'FK_k8hoadduq8snpouaq9nhvo6uo')->references(['enti_id'])->on('entidade');
        });

        Schema::table('produtorequisicao', function (Blueprint $table) {
            $table->foreign(['requisicaoMaterial_reqm_id'], 'FK_hw3o2yqbiowis42lgn131b1up')->references(['reqm_id'])->on('requisicaomaterial');
            $table->foreign(['Entidade_enti_id'], 'FK_dpt8opp9wngpymymemi9vbjvf')->references(['enti_id'])->on('entidade');
            $table->foreign(['produto_pro_id'], 'FK_s3p36wffag6kuyhpkd7lt6buf')->references(['pro_id'])->on('produto');
        });

        Schema::table('produtovendido', function (Blueprint $table) {
            $table->foreign(['produto_pro_id'], 'FK_bvo0424p1lwo9u8ri6oxcykry')->references(['pro_id'])->on('produto');
            $table->foreign(['Entidade_enti_id'], 'FK_1qfvgbf47f67lm1qe141li2w')->references(['enti_id'])->on('entidade');
            $table->foreign(['factura_fact_id'], 'FK_fd71ro974t7t11hmtn5tmcf6r')->references(['fact_id'])->on('factura');
        });

        Schema::table('recibo', function (Blueprint $table) {
            $table->foreign(['pessoa_pess_id'], 'FK_mruycpcwb5friinmuxpf2bg4l')->references(['pess_id'])->on('pessoa');
            $table->foreign(['entidade_enti_id'], 'FK_een6cvnfnmhsu7a1fr28gwdoh')->references(['enti_id'])->on('entidade');
            $table->foreign(['factura_fact_id'], 'FK_qwr1eh0n82isctf14l2udpkpf')->references(['fact_id'])->on('factura');
        });

        Schema::table('recibopagamento', function (Blueprint $table) {
            $table->foreign(['pessoa_pess_id'], 'FK_a9twha88ftu3gf0x0966lj23x')->references(['pess_id'])->on('pessoa');
            $table->foreign(['entidade_enti_id'], 'FK_a5nlf4y0qhcurr6q4vn8ebfym')->references(['enti_id'])->on('entidade');
        });

        Schema::table('registofecho', function (Blueprint $table) {
            $table->foreign(['produto_pro_id'], 'FK_fgmxjvb8v0ba0ck8akdt7bj90')->references(['pro_id'])->on('produto');
            $table->foreign(['fecho_fech_id'], 'FK_f060lgbl3b9vy1jxd4i75mfe0')->references(['fech_id'])->on('fecho');
            $table->foreign(['entidade_enti_id'], 'FK_gc4430dvlvhhefsyik11qrmvs')->references(['enti_id'])->on('entidade');
        });

        Schema::table('requisicao', function (Blueprint $table) {
            $table->foreign(['funcionario_func_id'], 'FK_k8gdenp9s9gtsh4sckx68n9dp')->references(['func_id'])->on('funcionario');
            $table->foreign(['entidade_enti_id'], 'FK_7falwqwg4kgiadq71fih8ktew')->references(['enti_id'])->on('entidade');
        });

        Schema::table('requisicaocheque', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_78crg2eren4brq6s86t1mfk1g')->references(['enti_id'])->on('entidade');
            $table->foreign(['tipoMovimentoCheque_tmc_id'], 'FK_sfn6anbmwqw1g12vn474lgr3w')->references(['tmc_id'])->on('tipomovimentocheque');
            $table->foreign(['funcionario_func_id'], 'FK_368l0h722rhcf58hyaodn7v70')->references(['func_id'])->on('funcionario');
            $table->foreign(['usuario_usua_id'], 'FK_hqdc0yqgj4xhim1y67130pu1b')->references(['usua_id'])->on('usuario');
        });

        Schema::table('requisicaofundo', function (Blueprint $table) {
            $table->foreign(['usuario3_usua_id'], 'FK_sdwxlng1jw3w633jmrg2oa9ic')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario2_usua_id'], 'FK_7jqsyys08pv6isl6b7yb9xre0')->references(['usua_id'])->on('usuario');
            $table->foreign(['usuario_usua_id'], 'FK_eolskwf9et44ahtpr0t2nbgad')->references(['usua_id'])->on('usuario');
            $table->foreign(['contrato_cont_id'], 'FK_tfedl3oltb9o8eovef5efsc66')->references(['cont_id'])->on('contrato');
            $table->foreign(['usuario4_usua_id'], 'FK_7a9d4b25td2bijvdrupoxcv2m')->references(['usua_id'])->on('usuario');
            $table->foreign(['entidade_enti_id'], 'FK_8vvou31981olxqv7d40psh6m2')->references(['enti_id'])->on('entidade');
        });

        Schema::table('requisicaomaterial', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_hliqklmlo1051ejs8cn1tmvx5')->references(['enti_id'])->on('entidade');
            $table->foreign(['pessoa_pess_id'], 'FK_8quo3tfx7cfk17w30t3rmg1m1')->references(['pess_id'])->on('pessoa');
        });

        Schema::table('resposta', function (Blueprint $table) {
            $table->foreign(['anoLectivo_anol_id'], 'FK_efvyvoswphpmjlxn4lsmvdqlb')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['disciplina_disc_id'], 'FK_mymag3ipaad3ocoat8eqjns87')->references(['disc_id'])->on('disciplina');
            $table->foreign(['curso_curs_id'], 'FK_2q2weqltc8r1nrok80c1ydqq8')->references(['curs_id'])->on('curso');
            $table->foreign(['entidade_enti_id'], 'FK_meoamw39mpd1o6sp7m1dlu0bv')->references(['enti_id'])->on('entidade');
        });

        Schema::table('sala', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_rc1qvyjvnfrjmk8p4ah0x0xmg')->references(['enti_id'])->on('entidade');
            $table->foreign(['escola_esc_id'], 'FK_oufefojirb3860t33r740oybr')->references(['esc_id'])->on('escola');
        });

        Schema::table('salaexame', function (Blueprint $table) {
            $table->foreign(['curso_curs_id'], 'FK_nc03gbvb75hx9xbnk1m3jtrk6')->references(['curs_id'])->on('curso');
            $table->foreign(['disciplina_disc_id'], 'FK_s2i6fb0xh6ojc5enpuqp9wi5r')->references(['disc_id'])->on('disciplina');
            $table->foreign(['juri2_doce_id'], 'FK_8wcs069go81f4why9bukdw7yl')->references(['doce_id'])->on('docente');
            $table->foreign(['sala_sala_id'], 'FK_lp8rrivbnydsgmq6lqq1toer1')->references(['sala_id'])->on('sala');
            $table->foreign(['juri1_doce_id'], 'FK_oo7etj1ejw11gwldvussvspho')->references(['doce_id'])->on('docente');
            $table->foreign(['anoLectivo_anol_id'], 'FK_5ad0wnuqph8a86784s2pm84i')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['entidade_enti_id'], 'FK_fc2836km5gbcc23k0blkbwl4o')->references(['enti_id'])->on('entidade');
        });

        Schema::table('sector', function (Blueprint $table) {
            $table->foreign(['departamento_dep_id'], 'FK_stiowgwspplgtscn7wxteio8r')->references(['dep_id'])->on('departamento');
            $table->foreign(['Entidade_enti_id'], 'FK_9svfi4tow0gol9ux1d12rgxqy')->references(['enti_id'])->on('entidade');
        });

        Schema::table('segmento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_nake4dksuegpookjkt7yi7bk2')->references(['enti_id'])->on('entidade');
        });

        Schema::table('servico', function (Blueprint $table) {
            $table->foreign(['horariohora_hora_id'], 'FK_axqvf43v4v6i1mbm6aphcm851')->references(['hora_id'])->on('horario');
            $table->foreign(['entidade_enti_id'], 'FK_4achjjr0xbks5n9k1wbkbrued')->references(['enti_id'])->on('entidade');
        });

        Schema::table('servicovendido', function (Blueprint $table) {
            $table->foreign(['factura_fact_id'], 'FK_oq1uxe1boyqak2jmaulagu563')->references(['fact_id'])->on('factura');
            $table->foreign(['entidade_enti_id'], 'FK_eij7ug2pvmknod4fnfas1x2wd')->references(['enti_id'])->on('entidade');
            $table->foreign(['servico_serv_id'], 'FK_syb43bc82t8yjtpkjlb2d0lsw')->references(['serv_id'])->on('servico');
        });

        Schema::table('sumario', function (Blueprint $table) {
            $table->foreign(['curso_curs_id'], 'FK_oecbiu66b904ef74s061oxqpb')->references(['curs_id'])->on('curso');
            $table->foreign(['escola_esc_id'], 'FK_2ye3jt4ejmc3bx0p8u58vobq7')->references(['esc_id'])->on('escola');
            $table->foreign(['tema_tema_id'], 'FK_j66ial8ufj23ubel985dv03ne')->references(['tema_id'])->on('tema');
            $table->foreign(['disciplina_disc_id'], 'FK_2w0wkbh7ep11riawie9i7bpim')->references(['disc_id'])->on('disciplina');
            $table->foreign(['entidade_enti_id'], 'FK_erkiyr7cye2qv80t10qrjhn9e')->references(['enti_id'])->on('entidade');
        });

        Schema::table('tamanho', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_408o2i3odp2h524j7iteb3cw6')->references(['enti_id'])->on('entidade');
        });

        Schema::table('taxa', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_tg5ij935hkthgihs7v7uou4al')->references(['enti_id'])->on('entidade');
        });

        Schema::table('tema', function (Blueprint $table) {
            $table->foreign(['escola_esc_id'], 'FK_mwlxog9vafn3tnjspa8b2wqua')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_wvu5tm95abblay70mpfsd0tw')->references(['enti_id'])->on('entidade');
            $table->foreign(['disciplina_disc_id'], 'FK_433hyqi59ej4b18urfh55ibwc')->references(['disc_id'])->on('disciplina');
            $table->foreign(['curso_curs_id'], 'FK_q6awj9i9f0vena7vmnqvfa8q8')->references(['curs_id'])->on('curso');
        });

        Schema::table('tipoconta', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_2swysbcfpbq0kyrvrhk8l9o99')->references(['enti_id'])->on('entidade');
        });

        Schema::table('tipodespesa', function (Blueprint $table) {
            $table->foreign(['Entidade_enti_id'], 'FK_n8cv7fhwx682504n7e84s1abm')->references(['enti_id'])->on('entidade');
        });

        Schema::table('tipomovimentocheque', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_ffn2ll5h290u1vo473qdxk1r8')->references(['enti_id'])->on('entidade');
        });

        Schema::table('tipopagamento', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_8hq7mqd70c8y7irqiyp4corde')->references(['enti_id'])->on('entidade');
        });

        Schema::table('tiposervico', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_es4rf2ptocmkdl7ug04x7qwn9')->references(['enti_id'])->on('entidade');
        });

        Schema::table('tipousuario', function (Blueprint $table) {
            $table->foreign(['nivelAcessoniva_niva_id'], 'FK_e5h1x62vnbq7ts4geevumdr29')->references(['niva_id'])->on('nivelacesso');
        });

        Schema::table('transferencia', function (Blueprint $table) {
            $table->foreign(['aluno_alun_id'], 'FK_6syssbmsi1avt5xd5o40cpan6')->references(['alun_id'])->on('aluno');
            $table->foreign(['entidade_enti_id'], 'FK_5xjx6fhh1fg1ma2jlfdwcxttp')->references(['enti_id'])->on('entidade');
            $table->foreign(['entidade2_enti_id'], 'FK_lhm6etrpb1kh7qlifece1fd1y')->references(['enti_id'])->on('entidade');
        });

        Schema::table('trial', function (Blueprint $table) {
            $table->foreign(['sistema_sist_id'], 'FK_6o75t58ve3g3lmc53y8uo2arl')->references(['sist_id'])->on('sistema');
            $table->foreign(['entidade_enti_id'], 'FK_2pi6vfkw2ux50mxrqpqotsc1f')->references(['enti_id'])->on('entidade');
        });

        Schema::table('turma', function (Blueprint $table) {
            $table->foreign(['sala_sala_id'], 'FK_r1eadv9h70hlo5gaeci57t604')->references(['sala_id'])->on('sala');
            $table->foreign(['anoLectivo_anol_id'], 'FK_bjtfwyhokopn8tmrlagm7g9u5')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['curso_curs_id'], 'FK_f0slo7hicixq14ep3d30x3ncn')->references(['curs_id'])->on('curso');
            $table->foreign(['escola_esc_id'], 'FK_5qqkdoye2cw1blidt4815bg4i')->references(['esc_id'])->on('escola');
            $table->foreign(['entidade_enti_id'], 'FK_elqbpy4e3ei8gxuwmd600mlnm')->references(['enti_id'])->on('entidade');
        });

        Schema::table('turno', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_na73qssrt3o6lgh71qb320qie')->references(['enti_id'])->on('entidade');
        });

        Schema::table('upload', function (Blueprint $table) {
            $table->foreign(['entidade_enti_id'], 'FK_td1bqjvx66r3n02u7e5p8w957')->references(['enti_id'])->on('entidade');
        });

        Schema::table('usuario', function (Blueprint $table) {
            $table->foreign(['pessoapess_pess_id'], 'FK_68hgfkgf5x972ri2g7r4qsobw')->references(['pess_id'])->on('pessoa');
            $table->foreign(['tipoUsuariotipu_tipu_id'], 'FK_edswmmi93y1eqnhfl9n4ecl4h')->references(['tipu_id'])->on('tipousuario');
            $table->foreign(['entidade_enti_id'], 'FK_5a5bibnjilke4mr7nkrmjticp')->references(['enti_id'])->on('entidade');
            $table->foreign(['escola_esc_id'], 'FK_7w82doj5vwuciq058t64vhhnc')->references(['esc_id'])->on('escola');
        });

        Schema::table('vagas', function (Blueprint $table) {
            $table->foreign(['anoLectivo_anol_id'], 'FK_bvb17gjdvwvbvoeidoj2lxb5x')->references(['anol_id'])->on('anolectivo');
            $table->foreign(['entidade_enti_id'], 'FK_9la7tk47w1r4nd1gwd9kh7fd6')->references(['enti_id'])->on('entidade');
            $table->foreign(['curso_curs_id'], 'FK_imyyp6nj14hwetb2ug3fqf714')->references(['curs_id'])->on('curso');
        });

        Schema::table('venda', function (Blueprint $table) {
            $table->foreign(['cliente_clie_id'], 'FK_ixrflhygeck3m49e55lrm4j3b')->references(['clie_id'])->on('cliente');
            $table->foreign(['Entidade_enti_id'], 'FK_4d1gvvw6bq6yprwe5y6b2b2ws')->references(['enti_id'])->on('entidade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('venda', function (Blueprint $table) {
            $table->dropForeign('FK_ixrflhygeck3m49e55lrm4j3b');
            $table->dropForeign('FK_4d1gvvw6bq6yprwe5y6b2b2ws');
        });

        Schema::table('vagas', function (Blueprint $table) {
            $table->dropForeign('FK_bvb17gjdvwvbvoeidoj2lxb5x');
            $table->dropForeign('FK_9la7tk47w1r4nd1gwd9kh7fd6');
            $table->dropForeign('FK_imyyp6nj14hwetb2ug3fqf714');
        });

        Schema::table('usuario', function (Blueprint $table) {
            $table->dropForeign('FK_68hgfkgf5x972ri2g7r4qsobw');
            $table->dropForeign('FK_edswmmi93y1eqnhfl9n4ecl4h');
            $table->dropForeign('FK_5a5bibnjilke4mr7nkrmjticp');
            $table->dropForeign('FK_7w82doj5vwuciq058t64vhhnc');
        });

        Schema::table('upload', function (Blueprint $table) {
            $table->dropForeign('FK_td1bqjvx66r3n02u7e5p8w957');
        });

        Schema::table('turno', function (Blueprint $table) {
            $table->dropForeign('FK_na73qssrt3o6lgh71qb320qie');
        });

        Schema::table('turma', function (Blueprint $table) {
            $table->dropForeign('FK_r1eadv9h70hlo5gaeci57t604');
            $table->dropForeign('FK_bjtfwyhokopn8tmrlagm7g9u5');
            $table->dropForeign('FK_f0slo7hicixq14ep3d30x3ncn');
            $table->dropForeign('FK_5qqkdoye2cw1blidt4815bg4i');
            $table->dropForeign('FK_elqbpy4e3ei8gxuwmd600mlnm');
        });

        Schema::table('trial', function (Blueprint $table) {
            $table->dropForeign('FK_6o75t58ve3g3lmc53y8uo2arl');
            $table->dropForeign('FK_2pi6vfkw2ux50mxrqpqotsc1f');
        });

        Schema::table('transferencia', function (Blueprint $table) {
            $table->dropForeign('FK_6syssbmsi1avt5xd5o40cpan6');
            $table->dropForeign('FK_5xjx6fhh1fg1ma2jlfdwcxttp');
            $table->dropForeign('FK_lhm6etrpb1kh7qlifece1fd1y');
        });

        Schema::table('tipousuario', function (Blueprint $table) {
            $table->dropForeign('FK_e5h1x62vnbq7ts4geevumdr29');
        });

        Schema::table('tiposervico', function (Blueprint $table) {
            $table->dropForeign('FK_es4rf2ptocmkdl7ug04x7qwn9');
        });

        Schema::table('tipopagamento', function (Blueprint $table) {
            $table->dropForeign('FK_8hq7mqd70c8y7irqiyp4corde');
        });

        Schema::table('tipomovimentocheque', function (Blueprint $table) {
            $table->dropForeign('FK_ffn2ll5h290u1vo473qdxk1r8');
        });

        Schema::table('tipodespesa', function (Blueprint $table) {
            $table->dropForeign('FK_n8cv7fhwx682504n7e84s1abm');
        });

        Schema::table('tipoconta', function (Blueprint $table) {
            $table->dropForeign('FK_2swysbcfpbq0kyrvrhk8l9o99');
        });

        Schema::table('tema', function (Blueprint $table) {
            $table->dropForeign('FK_mwlxog9vafn3tnjspa8b2wqua');
            $table->dropForeign('FK_wvu5tm95abblay70mpfsd0tw');
            $table->dropForeign('FK_433hyqi59ej4b18urfh55ibwc');
            $table->dropForeign('FK_q6awj9i9f0vena7vmnqvfa8q8');
        });

        Schema::table('taxa', function (Blueprint $table) {
            $table->dropForeign('FK_tg5ij935hkthgihs7v7uou4al');
        });

        Schema::table('tamanho', function (Blueprint $table) {
            $table->dropForeign('FK_408o2i3odp2h524j7iteb3cw6');
        });

        Schema::table('sumario', function (Blueprint $table) {
            $table->dropForeign('FK_oecbiu66b904ef74s061oxqpb');
            $table->dropForeign('FK_2ye3jt4ejmc3bx0p8u58vobq7');
            $table->dropForeign('FK_j66ial8ufj23ubel985dv03ne');
            $table->dropForeign('FK_2w0wkbh7ep11riawie9i7bpim');
            $table->dropForeign('FK_erkiyr7cye2qv80t10qrjhn9e');
        });

        Schema::table('servicovendido', function (Blueprint $table) {
            $table->dropForeign('FK_oq1uxe1boyqak2jmaulagu563');
            $table->dropForeign('FK_eij7ug2pvmknod4fnfas1x2wd');
            $table->dropForeign('FK_syb43bc82t8yjtpkjlb2d0lsw');
        });

        Schema::table('servico', function (Blueprint $table) {
            $table->dropForeign('FK_axqvf43v4v6i1mbm6aphcm851');
            $table->dropForeign('FK_4achjjr0xbks5n9k1wbkbrued');
        });

        Schema::table('segmento', function (Blueprint $table) {
            $table->dropForeign('FK_nake4dksuegpookjkt7yi7bk2');
        });

        Schema::table('sector', function (Blueprint $table) {
            $table->dropForeign('FK_stiowgwspplgtscn7wxteio8r');
            $table->dropForeign('FK_9svfi4tow0gol9ux1d12rgxqy');
        });

        Schema::table('salaexame', function (Blueprint $table) {
            $table->dropForeign('FK_nc03gbvb75hx9xbnk1m3jtrk6');
            $table->dropForeign('FK_s2i6fb0xh6ojc5enpuqp9wi5r');
            $table->dropForeign('FK_8wcs069go81f4why9bukdw7yl');
            $table->dropForeign('FK_lp8rrivbnydsgmq6lqq1toer1');
            $table->dropForeign('FK_oo7etj1ejw11gwldvussvspho');
            $table->dropForeign('FK_5ad0wnuqph8a86784s2pm84i');
            $table->dropForeign('FK_fc2836km5gbcc23k0blkbwl4o');
        });

        Schema::table('sala', function (Blueprint $table) {
            $table->dropForeign('FK_rc1qvyjvnfrjmk8p4ah0x0xmg');
            $table->dropForeign('FK_oufefojirb3860t33r740oybr');
        });

        Schema::table('resposta', function (Blueprint $table) {
            $table->dropForeign('FK_efvyvoswphpmjlxn4lsmvdqlb');
            $table->dropForeign('FK_mymag3ipaad3ocoat8eqjns87');
            $table->dropForeign('FK_2q2weqltc8r1nrok80c1ydqq8');
            $table->dropForeign('FK_meoamw39mpd1o6sp7m1dlu0bv');
        });

        Schema::table('requisicaomaterial', function (Blueprint $table) {
            $table->dropForeign('FK_hliqklmlo1051ejs8cn1tmvx5');
            $table->dropForeign('FK_8quo3tfx7cfk17w30t3rmg1m1');
        });

        Schema::table('requisicaofundo', function (Blueprint $table) {
            $table->dropForeign('FK_sdwxlng1jw3w633jmrg2oa9ic');
            $table->dropForeign('FK_7jqsyys08pv6isl6b7yb9xre0');
            $table->dropForeign('FK_eolskwf9et44ahtpr0t2nbgad');
            $table->dropForeign('FK_tfedl3oltb9o8eovef5efsc66');
            $table->dropForeign('FK_7a9d4b25td2bijvdrupoxcv2m');
            $table->dropForeign('FK_8vvou31981olxqv7d40psh6m2');
        });

        Schema::table('requisicaocheque', function (Blueprint $table) {
            $table->dropForeign('FK_78crg2eren4brq6s86t1mfk1g');
            $table->dropForeign('FK_sfn6anbmwqw1g12vn474lgr3w');
            $table->dropForeign('FK_368l0h722rhcf58hyaodn7v70');
            $table->dropForeign('FK_hqdc0yqgj4xhim1y67130pu1b');
        });

        Schema::table('requisicao', function (Blueprint $table) {
            $table->dropForeign('FK_k8gdenp9s9gtsh4sckx68n9dp');
            $table->dropForeign('FK_7falwqwg4kgiadq71fih8ktew');
        });

        Schema::table('registofecho', function (Blueprint $table) {
            $table->dropForeign('FK_fgmxjvb8v0ba0ck8akdt7bj90');
            $table->dropForeign('FK_f060lgbl3b9vy1jxd4i75mfe0');
            $table->dropForeign('FK_gc4430dvlvhhefsyik11qrmvs');
        });

        Schema::table('recibopagamento', function (Blueprint $table) {
            $table->dropForeign('FK_a9twha88ftu3gf0x0966lj23x');
            $table->dropForeign('FK_a5nlf4y0qhcurr6q4vn8ebfym');
        });

        Schema::table('recibo', function (Blueprint $table) {
            $table->dropForeign('FK_mruycpcwb5friinmuxpf2bg4l');
            $table->dropForeign('FK_een6cvnfnmhsu7a1fr28gwdoh');
            $table->dropForeign('FK_qwr1eh0n82isctf14l2udpkpf');
        });

        Schema::table('produtovendido', function (Blueprint $table) {
            $table->dropForeign('FK_bvo0424p1lwo9u8ri6oxcykry');
            $table->dropForeign('FK_1qfvgbf47f67lm1qe141li2w');
            $table->dropForeign('FK_fd71ro974t7t11hmtn5tmcf6r');
        });

        Schema::table('produtorequisicao', function (Blueprint $table) {
            $table->dropForeign('FK_hw3o2yqbiowis42lgn131b1up');
            $table->dropForeign('FK_dpt8opp9wngpymymemi9vbjvf');
            $table->dropForeign('FK_s3p36wffag6kuyhpkd7lt6buf');
        });

        Schema::table('produto', function (Blueprint $table) {
            $table->dropForeign('FK_o41y7r98r75obaqbbdc2hjl9c');
            $table->dropForeign('FK_idmkj9i4kwl7u1vsk7euocw26');
            $table->dropForeign('FK_ksnpb5s9vhlw4qyet836xq14q');
            $table->dropForeign('FK_96q57to8p0qtfln1txppbodkj');
            $table->dropForeign('FK_k8hoadduq8snpouaq9nhvo6uo');
        });

        Schema::table('presencas', function (Blueprint $table) {
            $table->dropForeign('FK_jrbwgptv6250nuxyvpvl4wfra');
            $table->dropForeign('FK_sdk292n9vboqcl0yhmt6kuwf3');
            $table->dropForeign('FK_1s86gw2gw3q1m1mob9nmndn4t');
            $table->dropForeign('FK_o16ns9ve81vtu7xcxhuj6cmqx');
        });

        Schema::table('preco', function (Blueprint $table) {
            $table->dropForeign('FK_giqja0oe0jkxn2qto934lj3k7');
        });

        Schema::table('planosaude', function (Blueprint $table) {
            $table->dropForeign('FK_rg0xllsi66v9golf1n1pa53y');
            $table->dropForeign('FK_9vny1fyrci8v5cdcqlwqrnovr');
        });

        Schema::table('planodeconta', function (Blueprint $table) {
            $table->dropForeign('FK_m0js5l1tb10ewts4u63mh0qre');
            $table->dropForeign('FK_jkqiofgh5a5sp15sf2h4fkwix');
        });

        Schema::table('petycash', function (Blueprint $table) {
            $table->dropForeign('FK_dk2s8208hgpkswub1mw8ijbsu');
            $table->dropForeign('FK_orvmwxycgqy4xmatsyu7gwr88');
            $table->dropForeign('FK_9m9qm0m3h894fd2ttfad9br3q');
            $table->dropForeign('FK_ltkehpnnjldfkdcs956udkaph');
        });

        Schema::table('pety', function (Blueprint $table) {
            $table->dropForeign('FK_iv3p9fufx82ldaso32d8ap72q');
        });

        Schema::table('pessoa', function (Blueprint $table) {
            $table->dropForeign('FK_sgqnd7nxdd12e55k3xchh6m69');
            $table->dropForeign('FK_nagwq4oa5q56x94iak41d0v3e');
        });

        Schema::table('periodosalarial', function (Blueprint $table) {
            $table->dropForeign('FK_amkgr1nuve6rn2x9l1wwidi7x');
            $table->dropForeign('FK_n86ghfraa4lntmqncj46ws0cr');
            $table->dropForeign('FK_9ftg9tf7g0yisx31vxp7au8jm');
            $table->dropForeign('FK_g6hynq896la38h54a9ncjfbwt');
        });

        Schema::table('pdf', function (Blueprint $table) {
            $table->dropForeign('FK_dixllrvenrnav3xhbvxafw4k7');
        });

        Schema::table('parceiro', function (Blueprint $table) {
            $table->dropForeign('FK_8xcy30fnj5f3aivlrebj77chw');
        });

        Schema::table('pagamento', function (Blueprint $table) {
            $table->dropForeign('FK_lyevni07eq966mcvq9mkkk25v');
            $table->dropForeign('FK_2npd64r3pm1bfeo5okvtkqeud');
            $table->dropForeign('FK_4hjbtodk3l25mgwmf53nsg9kf');
            $table->dropForeign('FK_peu87n5vy56271rmp1ca1n8rx');
            $table->dropForeign('FK_1kd8i3l96jcb8q95oo4m5chy3');
            $table->dropForeign('FK_3idshtgvh2x3c7xqp8e28govb');
        });

        Schema::table('notas', function (Blueprint $table) {
            $table->dropForeign('FK_m9xigny2j8ml20pbayewwoxa0');
            $table->dropForeign('FK_8pfotl50da7a8bptenacyt172');
            $table->dropForeign('FK_fe3oe0fg0bqbr3s7itq7qufxc');
            $table->dropForeign('FK_npauu1jp16y8ynvkx1gxuyp92');
            $table->dropForeign('FK_1c8qjujjprm04lmiy71pcjrf7');
            $table->dropForeign('FK_8tunkwvd1cb5vqhdw500mw2tm');
        });

        Schema::table('nivelacesso', function (Blueprint $table) {
            $table->dropForeign('FK_5rlfyqoopm3uj1020x77t1c8q');
        });

        Schema::table('movimento', function (Blueprint $table) {
            $table->dropForeign('FK_dm0ob0oesk0xfe2qmggquu371');
            $table->dropForeign('FK_16gy57vr9j4vlabrkkaf5yonr');
            $table->dropForeign('FK_r01a5wotlfpfssovpw16olj6f');
        });

        Schema::table('moeda', function (Blueprint $table) {
            $table->dropForeign('FK_2rnrolstx6iaj0b4vgk0wbjd2');
        });

        Schema::table('modulousuario', function (Blueprint $table) {
            $table->dropForeign('FK_hxhp0fppiir6fjjdfk6cpig11');
            $table->dropForeign('FK_84t0hynggh54oqmn0mt2hax6o');
        });

        Schema::table('modulosusuariomarket', function (Blueprint $table) {
            $table->dropForeign('FK_ibpxaq5rn7mikbprq7ejgmxf7');
            $table->dropForeign('FK_fn5lc3asuu38xwaddm5b79cvo');
        });

        Schema::table('modulosusuario', function (Blueprint $table) {
            $table->dropForeign('FK_lpxi2bq9hq5esqwyk3y8vr7vh');
            $table->dropForeign('FK_5nnpix6in7o42ph0bxrxofc18');
        });

        Schema::table('moduloacesso', function (Blueprint $table) {
            $table->dropForeign('FK_ksdsgaq9vxjai8v1e06a344e1');
            $table->dropForeign('FK_jc0kkxavfkfp4f0yb1d3iyod8');
        });

        Schema::table('modulo', function (Blueprint $table) {
            $table->dropForeign('FK_adl9w4cemnv5u8vaows0dsgi4');
            $table->dropForeign('FK_35wc18gb5q0mek2vgauchahr');
        });

        Schema::table('mensalidade', function (Blueprint $table) {
            $table->dropForeign('FK_55drx7a8y9d0yjxfmivwcqxqj');
            $table->dropForeign('FK_4vprncqyqt1w7rcsqd809l8so');
            $table->dropForeign('FK_rq9ygnvbbk6etbp9awc9kstfu');
        });

        Schema::table('meiopagamento', function (Blueprint $table) {
            $table->dropForeign('FK_8lf5vr0g0jmtxi28w4q3sotj8');
        });

        Schema::table('media', function (Blueprint $table) {
            $table->dropForeign('FK_ie7tc2p7ppkh5r56t09ydlkfm');
            $table->dropForeign('FK_8c1otoe3gpk18icphq8m7swwq');
            $table->dropForeign('FK_dq9itvdjwejv4xxe58gdxckd4');
            $table->dropForeign('FK_syeeo0owc0kpoi63pms4jncrq');
            $table->dropForeign('FK_24j3ky0oiyqrnbb6njf1hcvcj');
            $table->dropForeign('FK_a5y2kmp2d4ps55ejivqqxkq4q');
        });

        Schema::table('log', function (Blueprint $table) {
            $table->dropForeign('FK_53yj8pgaidsaeif40iu3ltj7k');
            $table->dropForeign('FK_17hwvurguvvlewxi4utq6fe59');
            $table->dropForeign('FK_hrw7vv9m5xq0synxuq10kmfay');
        });

        Schema::table('listatelefonica', function (Blueprint $table) {
            $table->dropForeign('FK_gmjl77s4abl5s2w1ldn62necl');
        });

        Schema::table('lembrete', function (Blueprint $table) {
            $table->dropForeign('FK_83e03e4682r7v5nyfl0il6kpc');
            $table->dropForeign('FK_3qtx9c5ectk7q1la7jb0vmb8d');
        });

        Schema::table('lancamento', function (Blueprint $table) {
            $table->dropForeign('FK_mprqyx6w9rr06o84bodlm3406');
            $table->dropForeign('FK_r4j1v194l8i4ysuagvryxpjlp');
            $table->dropForeign('FK_4q6hf7htlr5elu5u89juqux52');
            $table->dropForeign('FK_7oolibak82pjyp9pnd0o9crvx');
            $table->dropForeign('FK_oyykrytdsxa69dw06x1dpus9t');
            $table->dropForeign('FK_slrnvtmw8hgql7iie4yhwar21');
            $table->dropForeign('FK_2swohlsdgt8vf5eykgnxgdl3e');
            $table->dropForeign('FK_67f5hhyr6l5mdaer2m1j6qdmv');
        });

        Schema::table('itemrequisicaocheque', function (Blueprint $table) {
            $table->dropForeign('FK_ewpabkfw2dqvp7tsk3cx5vnyg');
            $table->dropForeign('FK_12197cy63f32t5lair2notisb');
        });

        Schema::table('itemrequisicao', function (Blueprint $table) {
            $table->dropForeign('FK_9lp4bpu7ge71o3033i0qh1woh');
            $table->dropForeign('FK_739knyv4nj73gyrsch0pt46ay');
        });

        Schema::table('itempedido', function (Blueprint $table) {
            $table->dropForeign('FK_gcnldac310v1ro23xsngeq89');
            $table->dropForeign('FK_5gafq0bq1ce9j0mlo6436y6hk');
            $table->dropForeign('FK_m6m2s7nhn25qfgodw35mi4ksr');
        });

        Schema::table('isencao', function (Blueprint $table) {
            $table->dropForeign('FK_mcx522b08kyjqksylpusbuu01');
        });

        Schema::table('inscricao', function (Blueprint $table) {
            $table->dropForeign('FK_s1nuxyfeo8b80m8ni7by9kikr');
            $table->dropForeign('FK_9erfl299rv2wy5n2cp0fn9ks0');
            $table->dropForeign('FK_gx178uqpqdb0i87lukjifj3nl');
            $table->dropForeign('FK_yuw9jl6rvbeahytnik5cgh4q');
            $table->dropForeign('FK_96ffud0y1ccfyvcwkq1366cn8');
            $table->dropForeign('FK_bowie4p725a210no3ukjgtxxi');
        });

        Schema::table('horas', function (Blueprint $table) {
            $table->dropForeign('FK_dib40nsrei872umfjtkxdh23c');
            $table->dropForeign('FK_283l5evl1uv8otjdkda4nl4w1');
        });

        Schema::table('horario', function (Blueprint $table) {
            $table->dropForeign('FK_dw45ijcfdjf3ejgtagpfnun3q');
        });

        Schema::table('habilitacao', function (Blueprint $table) {
            $table->dropForeign('FK_mpwhy6rc2ob5q7q5ksors7ij4');
        });

        Schema::table('guiaremessa', function (Blueprint $table) {
            $table->dropForeign('FK_l4exrkq98om6k1mhr9k688uls');
            $table->dropForeign('FK_3pa1ddgb0c6u7r5o3jcpn7jw9');
            $table->dropForeign('FK_l40btg65x6s39xpu7f6q3ojsq');
            $table->dropForeign('FK_o9jkf50bybenc11pbgs2wofgs');
            $table->dropForeign('FK_2ccv55iw83bna0crobsh1xcxw');
            $table->dropForeign('FK_fgm9y04ssd5yjyvd3r8e9kcog');
        });

        Schema::table('funcionario', function (Blueprint $table) {
            $table->dropForeign('FK_gvnobskteqgnk8i1tf3e80bqy');
            $table->dropForeign('FK_7iig7u2dakc9dqvtqfako35rv');
            $table->dropForeign('FK_asduo33c7kpj1pu8m53bgo21k');
            $table->dropForeign('FK_mm6nma58ue2cyv16pqjr7j0gb');
            $table->dropForeign('FK_7enln7j79flqeno2m1akdtvib');
            $table->dropForeign('FK_8hbn26lkhmttkvj53456jqinf');
        });

        Schema::table('fornecedor', function (Blueprint $table) {
            $table->dropForeign('FK_htg20ra8oqcm3h9gc5vr4uybj');
        });

        Schema::table('formulariosusuario', function (Blueprint $table) {
            $table->dropForeign('FK_qedv1256qr19185d74h659puh');
            $table->dropForeign('FK_akknnmwc7s8jbcgiwk7ffkjpg');
        });

        Schema::table('formulario', function (Blueprint $table) {
            $table->dropForeign('FK_oax4s6ao8ok58c0a14xdkh5ll');
        });

        Schema::table('formacao', function (Blueprint $table) {
            $table->dropForeign('FK_p83i1d8a2jqrag3wv0hwjedrj');
            $table->dropForeign('FK_gik3tgutl9uodaf2q94scyv3g');
        });

        Schema::table('folhasalarial', function (Blueprint $table) {
            $table->dropForeign('FK_53fqtis9ydqbgfg7gtge9afxl');
            $table->dropForeign('FK_4s3mlynr6yl3p8bxo09c4wgwx');
        });

        Schema::table('fluxo', function (Blueprint $table) {
            $table->dropForeign('FK_rx18ia004wj6jp8urmvwfsgkk');
            $table->dropForeign('FK_932fvs2xhjy0ebqf552vry3c8');
            $table->dropForeign('FK_oq56wted8d2j7ltb1u1bjfvon');
            $table->dropForeign('FK_rxxvlgty2vwtusi5mlulpppfe');
            $table->dropForeign('FK_1yk8x0ntt12sso9u5yfnei4gf');
            $table->dropForeign('FK_9888de7hay47qg0yhagmnx41');
        });

        Schema::table('firma', function (Blueprint $table) {
            $table->dropForeign('FK_d5jmo64oggci0jrax2wwci3qx');
        });

        Schema::table('ferias', function (Blueprint $table) {
            $table->dropForeign('FK_kud22pc3xtvpc82tvof058f05');
            $table->dropForeign('FK_7ogq58mmtmp7gx5g142ds318k');
        });

        Schema::table('fecho', function (Blueprint $table) {
            $table->dropForeign('FK_j2jny3mpptg4l9eb65ydhgrt7');
            $table->dropForeign('FK_a2pypwlps868k2h25ijd3x4c9');
        });

        Schema::table('faltas', function (Blueprint $table) {
            $table->dropForeign('FK_s4jc3autodujjf41a380ejil8');
            $table->dropForeign('FK_hqjkt4f6b6kuyihe43fh2ok4v');
        });

        Schema::table('factura', function (Blueprint $table) {
            $table->dropForeign('FK_f2ubmtdurx6mjqagc9ibcab8d');
            $table->dropForeign('FK_l9cu83u86jv7swv2sayt2066h');
            $table->dropForeign('FK_3hvhu0mt8vrm460rsarcjgn9d');
            $table->dropForeign('FK_btj7lhcqrg4kcqtq1nn9x0d6w');
            $table->dropForeign('FK_h7f67f4gdqlmkc705e397fy8a');
            $table->dropForeign('FK_n9q1itic7w1m80i9fksj1f7ed');
            $table->dropForeign('FK_158uv0y880xxre18kwkayp4lp');
            $table->dropForeign('FK_a70gyxw3dru3i5yrb6k17e9xq');
        });

        Schema::table('extractocontageral', function (Blueprint $table) {
            $table->dropForeign('FK_k358qt33e6loreuv1jnmnncib');
            $table->dropForeign('FK_19gkfusc1nfoicys516judg7m');
            $table->dropForeign('FK_k4i70e28jhu9nia1xn6bjhc6j');
        });

        Schema::table('extracto', function (Blueprint $table) {
            $table->dropForeign('FK_ccf1yuw773xr9tltok1h48hf');
            $table->dropForeign('FK_a4mmrye6vdk99babdgo11611r');
        });

        Schema::table('exame', function (Blueprint $table) {
            $table->dropForeign('FK_hypknfacmlg2muescafsxjx0y');
            $table->dropForeign('FK_6yr3292ylfg9uues9k28edlrf');
            $table->dropForeign('FK_ao14u1oumwx3su9r6f3mg3tca');
            $table->dropForeign('FK_ohlqhdvrnddsfac8yrvrj6k8h');
            $table->dropForeign('FK_6cn7ybgwypslpusof4jfmafr5');
            $table->dropForeign('FK_7fp9b02gfuj5ihrpned1qdie5');
        });

        Schema::table('documento', function (Blueprint $table) {
            $table->dropForeign('FK_kmtl648ennkv78qmqmk4xa46u');
            $table->dropForeign('FK_7nn20ephejebgdiqa7nefaggt');
        });

        Schema::table('docenteturma', function (Blueprint $table) {
            $table->dropForeign('FK_l8u5pwbh9neqhp3ku2gftjheb');
            $table->dropForeign('FK_2lwqcfjywgpyj3wbhl1nsx6f0');
            $table->dropForeign('FK_q14kouux2noty67ph80ihj8r4');
        });

        Schema::table('docente', function (Blueprint $table) {
            $table->dropForeign('FK_ataa0n6q7saq8j56lf0toywre');
            $table->dropForeign('FK_43lkif5xlit28rml5m1tdgr5a');
            $table->dropForeign('FK_qn8muyudxkb50x3vpnebqkrwi');
        });

        Schema::table('doc', function (Blueprint $table) {
            $table->dropForeign('FK_lho08pgudxfeu30j095lhmu71');
            $table->dropForeign('FK_tjdx0op0bm45fprc5ay9jkyaa');
            $table->dropForeign('FK_5o947e57pp40bdkpy1y3cdq08');
            $table->dropForeign('FK_ldeks5i11tw7bqgs0m2v95lw0');
            $table->dropForeign('FK_qr4ly0f28e1x76b7jjitigub2');
            $table->dropForeign('FK_4qtl42972kex8o60r6voski7k');
            $table->dropForeign('FK_dhlomryq5ayjbncd0miomx8dy');
        });

        Schema::table('disciplinadocente', function (Blueprint $table) {
            $table->dropForeign('FK_a3myhb0nm58vso67pghet6h1');
            $table->dropForeign('FK_4hio7nrflk1nhjkrjanf6ncvv');
            $table->dropForeign('FK_kg4evqx1x2qw882martam55or');
        });

        Schema::table('disciplinacurso', function (Blueprint $table) {
            $table->dropForeign('FK_m28yaqqphd17gldaxbdhx0s6o');
            $table->dropForeign('FK_6kwg61ee7c432fakqmn6mjmw0');
            $table->dropForeign('FK_qihsrlaipmg9xxtkwssw8m6bk');
        });

        Schema::table('disciplina', function (Blueprint $table) {
            $table->dropForeign('FK_grsg69oau24l68e1anxnohfow');
        });

        Schema::table('diario', function (Blueprint $table) {
            $table->dropForeign('FK_johda3lae471pitwiv31dewhg');
        });

        Schema::table('despesa', function (Blueprint $table) {
            $table->dropForeign('FK_jhsaoifwu41688cg6seyh6ybr');
            $table->dropForeign('FK_ix6fw0l8nm6vwwdxgs9s12wi1');
            $table->dropForeign('FK_ob59rwsh7ee50cnugp7xckkri');
        });

        Schema::table('dependente', function (Blueprint $table) {
            $table->dropForeign('FK_7qbhfckctc3jpv2acc94d8eco');
            $table->dropForeign('FK_24wnkht2g6i5k24m07kxyd2ug');
        });

        Schema::table('departamento', function (Blueprint $table) {
            $table->dropForeign('FK_eejspavkwhwuak1pq2uu3nssi');
            $table->dropForeign('FK_a756kbm4bsk6qrt6xhapj7l30');
            $table->dropForeign('FK_ntecai3lm5d1sa3ayu7ti3yo6');
        });

        Schema::table('curso', function (Blueprint $table) {
            $table->dropForeign('FK_bkd5vu4xxqy225d2o6xnlgq8a');
            $table->dropForeign('FK_5oh9yrcu7v3hvcwfbs14acxrg');
        });

        Schema::table('convocatoria', function (Blueprint $table) {
            $table->dropForeign('FK_t3hiysasu59vo0q8dkbxwqtji');
            $table->dropForeign('FK_e0xt4d8ncvmnwlychpy9ly9tw');
            $table->dropForeign('FK_hh963dw5wk8duqwvdx0r5h0t0');
            $table->dropForeign('FK_apoof1bkue143pkqin5kwwx4y');
            $table->dropForeign('FK_gkdc0jlmd4xm2xgp62eivb0rb');
        });

        Schema::table('convocado', function (Blueprint $table) {
            $table->dropForeign('FK_ajfqe71ni8lnju81afalc31t0');
            $table->dropForeign('FK_svbwen9x84a0an3kwvqbouh5a');
            $table->dropForeign('FK_8xcrfflv1v2wfcm07rx97dkv7');
            $table->dropForeign('FK_dtqf2v1wb9pyu7k811xvf0ufg');
        });

        Schema::table('contrato', function (Blueprint $table) {
            $table->dropForeign('FK_ai16kqg1fsg5a9lx2hjtm132u');
        });

        Schema::table('contracto', function (Blueprint $table) {
            $table->dropForeign('FK_4lts1hkl27bjgyuc7wgpksd4v');
            $table->dropForeign('FK_kmoo260fu7x7dxasdt7xw2s4s');
            $table->dropForeign('FK_2t6gxr1ohqqabxf71yc36rh3d');
            $table->dropForeign('FK_7one04jhrnowbxeji0ik25qo5');
        });

        Schema::table('contageral', function (Blueprint $table) {
            $table->dropForeign('FK_qf5yrej3obl5admbo3k1c50gu');
        });

        Schema::table('contacorrente', function (Blueprint $table) {
            $table->dropForeign('FK_70irf027dlsm901xfflndo8m1');
            $table->dropForeign('FK_14l1faakxfivcksjppmw695x4');
            $table->dropForeign('FK_pnihc8swojf73k4mvlu7bnsm4');
        });

        Schema::table('conta', function (Blueprint $table) {
            $table->dropForeign('FK_nex8koc1uo9mlnrdfjcguwjw9');
            $table->dropForeign('FK_asdv8b3rjfjtilsw5hftw7eoe');
            $table->dropForeign('FK_sjijacd720ikrpj8citoj25e5');
        });

        Schema::table('condicaopagamento', function (Blueprint $table) {
            $table->dropForeign('FK_jd8q8vknvxr8bglmvepxv6j6d');
        });

        Schema::table('codigo', function (Blueprint $table) {
            $table->dropForeign('FK_9jcxm9npbsq43k8s73ovjdb48');
        });

        Schema::table('cliente', function (Blueprint $table) {
            $table->dropForeign('FK_3d8yf1m8qy81ovurrtetgubve');
            $table->dropForeign('FK_10brqolm3gt59gcakn2o146u0');
        });

        Schema::table('categoriaproduto', function (Blueprint $table) {
            $table->dropForeign('FK_56q3cja2toqw8xna7maeddhox');
        });

        Schema::table('categoria', function (Blueprint $table) {
            $table->dropForeign('FK_i3x8qikv8e5w53bslwwe5app5');
        });

        Schema::table('cargo', function (Blueprint $table) {
            $table->dropForeign('FK_om59n1p8simtxunk78xsc7v65');
        });

        Schema::table('calendarioexame', function (Blueprint $table) {
            $table->dropForeign('FK_rvd5vqdpebu392hsuw6bmismo');
            $table->dropForeign('FK_wuumfdmtmy08penr2x2gsvnf');
            $table->dropForeign('FK_3x7p6epyknjn2jfceuqjcgvi7');
            $table->dropForeign('FK_ucqb3a5culx0xu4gbmv07eta');
        });

        Schema::table('calendario', function (Blueprint $table) {
            $table->dropForeign('FK_98mxa2b9760hj8sv2187uahnh');
            $table->dropForeign('FK_e6po33lyxud6bv0671pmpxejw');
            $table->dropForeign('FK_mwds2x932u8pnkos7j8veq0oo');
            $table->dropForeign('FK_5g188ca99e6q7hhbpjikw6tta');
            $table->dropForeign('FK_7746ft7hog9q6i39bh1m3ffvc');
            $table->dropForeign('FK_9fgbiary8onfif286f2ykm8lg');
            $table->dropForeign('FK_gccsrxn9qkuasrga6x1v4obmr');
            $table->dropForeign('FK_32uujplvdhlrg5oa979oq5vdu');
            $table->dropForeign('FK_ry23c7th8hjprj2ef7k0w52qv');
            $table->dropForeign('FK_74odnvyv7w55sfw52tffsoqlw');
        });

        Schema::table('caixa', function (Blueprint $table) {
            $table->dropForeign('FK_84bo5166rmesb0lo963phjpq5');
            $table->dropForeign('FK_2mu894nt40t16ldsyngkbgdiq');
            $table->dropForeign('FK_nltlbgf39bw31uim62xof7xom');
        });

        Schema::table('browser', function (Blueprint $table) {
            $table->dropForeign('FK_nf9r0bemspgneg8ixbm91f98r');
        });

        Schema::table('boletim', function (Blueprint $table) {
            $table->dropForeign('FK_om82qwj8rf5r3grbk5so4yxd8');
            $table->dropForeign('FK_86y8cp7luvxmoq2mnrfqw7ivf');
        });

        Schema::table('banco', function (Blueprint $table) {
            $table->dropForeign('FK_47jyd7i2oqfr8g2w6320q8ujh');
        });

        Schema::table('avaliacao', function (Blueprint $table) {
            $table->dropForeign('FK_mcyawqa1dsvq17stmpkitaet4');
            $table->dropForeign('FK_avqgkwb66f9siw8injhgo9nhl');
        });

        Schema::table('assiduidade', function (Blueprint $table) {
            $table->dropForeign('FK_taej257uv67ps6ht9rdou3s45');
            $table->dropForeign('FK_knqx8leyqvxp3an5btor1s5sw');
        });

        Schema::table('areaformacao', function (Blueprint $table) {
            $table->dropForeign('FK_4w1f237uce4cil3kbi8851nvx');
        });

        Schema::table('area', function (Blueprint $table) {
            $table->dropForeign('FK_5y4xdnrg1vra75xtn1hc8s8cj');
        });

        Schema::table('anolectivo', function (Blueprint $table) {
            $table->dropForeign('FK_frxat7s9w6gnsrjfp5xy1av0b');
        });

        Schema::table('aluno', function (Blueprint $table) {
            $table->dropForeign('FK_8lki430ac35iaf284bhyll6xj');
            $table->dropForeign('FK_kbjdu10dy3f1mmvnruhhnbmbi');
            $table->dropForeign('FK_7dkxvmvikn17q78r35w1odj7q');
            $table->dropForeign('FK_ai5syhs7i5hit0uifd43a4qje');
        });

        Schema::table('agendacontacto', function (Blueprint $table) {
            $table->dropForeign('FK_o1pybgirwo21hn32lt6pyyi3j');
            $table->dropForeign('FK_58w7bp1psw78epuvw8s7kii18');
            $table->dropForeign('FK_e4pp2pqoiae206duif7dwtkt3');
            $table->dropForeign('FK_20t05635ee2d1ao4et3olhg3m');
            $table->dropForeign('FK_dalbjoormil0teywq3qq9dqvk');
        });

        Schema::table('agenda', function (Blueprint $table) {
            $table->dropForeign('FK_3gi8xqmtd9khgc1scftmi992q');
            $table->dropForeign('FK_ondexcxujgssi7jgwix1ttsi');
            $table->dropForeign('FK_2emmtpsc80b2xtsm4cs5qrh7v');
            $table->dropForeign('FK_7ysi2nb4tddwb49y2h2qtlwex');
        });

        Schema::table('administracao', function (Blueprint $table) {
            $table->dropForeign('FK_aew1eoj0u4en2ssyeipyc74g0');
        });

        Schema::table('adenda', function (Blueprint $table) {
            $table->dropForeign('FK_m0wbiuqlirtddf0q9dkorb72');
            $table->dropForeign('FK_752xlf1p4w319pbpnkrdn3yi1');
            $table->dropForeign('FK_kanbae4v9j5ibqvb289ghlyh3');
            $table->dropForeign('FK_1dcxp4uiuydwbouseceykbg9i');
            $table->dropForeign('FK_fuf7gv7dx8a2qmym7cgcsvsuq');
        });

        Schema::table('activo', function (Blueprint $table) {
            $table->dropForeign('FK_rp47hp38awi1fpqoc4ebmp5qp');
            $table->dropForeign('FK_c7i9rp55yxtixj2ofssn83vne');
        });

        Schema::table('acta', function (Blueprint $table) {
            $table->dropForeign('FK_jdk8fs8ddg0l1audjacebf9ni');
            $table->dropForeign('FK_ikxryj1skdd6myt9vg56s3l3p');
            $table->dropForeign('FK_rdggjixm1br6m0q43qppai9ec');
        });

        Schema::dropIfExists('venda');

        Schema::dropIfExists('vagas');

        Schema::dropIfExists('usuario');

        Schema::dropIfExists('users');

        Schema::dropIfExists('upload');

        Schema::dropIfExists('turno');

        Schema::dropIfExists('turma');

        Schema::dropIfExists('trial');

        Schema::dropIfExists('transferencia');

        Schema::dropIfExists('tipousuario');

        Schema::dropIfExists('tiposervico');

        Schema::dropIfExists('tipopagamento');

        Schema::dropIfExists('tipomovimentocheque');

        Schema::dropIfExists('tipodespesa');

        Schema::dropIfExists('tipocontacto');

        Schema::dropIfExists('tipoconta');

        Schema::dropIfExists('tema');

        Schema::dropIfExists('taxa');

        Schema::dropIfExists('tamanho');

        Schema::dropIfExists('sumario');

        Schema::dropIfExists('sistema');

        Schema::dropIfExists('servicovendido');

        Schema::dropIfExists('servico');

        Schema::dropIfExists('segmento');

        Schema::dropIfExists('sector');

        Schema::dropIfExists('salaexame');

        Schema::dropIfExists('sala');

        Schema::dropIfExists('resposta');

        Schema::dropIfExists('requisicaomaterial');

        Schema::dropIfExists('requisicaofundo');

        Schema::dropIfExists('requisicaocheque');

        Schema::dropIfExists('requisicao');

        Schema::dropIfExists('registofecho');

        Schema::dropIfExists('referencia');

        Schema::dropIfExists('recibopagamento');

        Schema::dropIfExists('recibo');

        Schema::dropIfExists('produtovendido');

        Schema::dropIfExists('produtorequisicao');

        Schema::dropIfExists('produto');

        Schema::dropIfExists('presencas');

        Schema::dropIfExists('preco');

        Schema::dropIfExists('planosaude');

        Schema::dropIfExists('planodeconta');

        Schema::dropIfExists('petycash');

        Schema::dropIfExists('pety');

        Schema::dropIfExists('pessoa');

        Schema::dropIfExists('personal_access_tokens');

        Schema::dropIfExists('periodosalarial');

        Schema::dropIfExists('pdf');

        Schema::dropIfExists('parceiro');

        Schema::dropIfExists('pagamento');

        Schema::dropIfExists('notas');

        Schema::dropIfExists('nivelprioridade');

        Schema::dropIfExists('nivelacesso');

        Schema::dropIfExists('nacionalidade');

        Schema::dropIfExists('movimento');

        Schema::dropIfExists('moeda');

        Schema::dropIfExists('modulousuario');

        Schema::dropIfExists('modulosusuariomarket');

        Schema::dropIfExists('modulosusuario');

        Schema::dropIfExists('moduloacesso');

        Schema::dropIfExists('modulo');

        Schema::dropIfExists('mensalidade');

        Schema::dropIfExists('meiopagamento');

        Schema::dropIfExists('media');

        Schema::dropIfExists('matricula');

        Schema::dropIfExists('log');

        Schema::dropIfExists('listatelefonica');

        Schema::dropIfExists('lembrete');

        Schema::dropIfExists('lancamento');

        Schema::dropIfExists('itemrequisicaocheque');

        Schema::dropIfExists('itemrequisicao');

        Schema::dropIfExists('itempedido');

        Schema::dropIfExists('isencao');

        Schema::dropIfExists('inscricao');

        Schema::dropIfExists('horas');

        Schema::dropIfExists('horario');

        Schema::dropIfExists('habilitacao');

        Schema::dropIfExists('guiaremessa');

        Schema::dropIfExists('funcionario');

        Schema::dropIfExists('fornecedor');

        Schema::dropIfExists('formulariosusuario');

        Schema::dropIfExists('formulario');

        Schema::dropIfExists('formacao');

        Schema::dropIfExists('folhasalarial');

        Schema::dropIfExists('fluxo');

        Schema::dropIfExists('firma');

        Schema::dropIfExists('ferias');

        Schema::dropIfExists('fecho');

        Schema::dropIfExists('faltas');

        Schema::dropIfExists('falta');

        Schema::dropIfExists('factura');

        Schema::dropIfExists('extractocontageral');

        Schema::dropIfExists('extracto');

        Schema::dropIfExists('exame');

        Schema::dropIfExists('estadofactura');

        Schema::dropIfExists('escola');

        Schema::dropIfExists('entidade');

        Schema::dropIfExists('documento');

        Schema::dropIfExists('docenteturma');

        Schema::dropIfExists('docente');

        Schema::dropIfExists('doc');

        Schema::dropIfExists('disciplinadocente');

        Schema::dropIfExists('disciplinacurso');

        Schema::dropIfExists('disciplina');

        Schema::dropIfExists('diasemana');

        Schema::dropIfExists('diario');

        Schema::dropIfExists('despesa');

        Schema::dropIfExists('dependente');

        Schema::dropIfExists('departamento');

        Schema::dropIfExists('curso');

        Schema::dropIfExists('cor');

        Schema::dropIfExists('convocatoria');

        Schema::dropIfExists('convocado');

        Schema::dropIfExists('contrato');

        Schema::dropIfExists('contracto');

        Schema::dropIfExists('contageral');

        Schema::dropIfExists('contacorrente');

        Schema::dropIfExists('conta');

        Schema::dropIfExists('condicaopagamento');

        Schema::dropIfExists('codigo');

        Schema::dropIfExists('cliente');

        Schema::dropIfExists('cidade');

        Schema::dropIfExists('categoriaproduto');

        Schema::dropIfExists('categoria');

        Schema::dropIfExists('cargo');

        Schema::dropIfExists('calendarioexame');

        Schema::dropIfExists('calendario');

        Schema::dropIfExists('caixa');

        Schema::dropIfExists('browser');

        Schema::dropIfExists('boletim');

        Schema::dropIfExists('banco');

        Schema::dropIfExists('avaliacao');

        Schema::dropIfExists('assiduidade');

        Schema::dropIfExists('areaformacao');

        Schema::dropIfExists('area');

        Schema::dropIfExists('aproveitamento');

        Schema::dropIfExists('anolectivo');

        Schema::dropIfExists('aluno');

        Schema::dropIfExists('agendacontacto');

        Schema::dropIfExists('agenda');

        Schema::dropIfExists('administracao');

        Schema::dropIfExists('adenda');

        Schema::dropIfExists('activo');

        Schema::dropIfExists('acta');
    }
}
