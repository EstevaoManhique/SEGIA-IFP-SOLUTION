const schema = {
    'NOME COMPLETO': {
        prop: 'full_name',
        type: String,
        required: true,
    },
    'DOC.': {
        prop: 'doc_type',
        type: String,
        required: true,
    },
    'NR. DOC.': {
        prop: 'nr_doc',
        type: String,
        required: true,
    },
    'VALIDADE DOC.': {
        prop: 'doc_date',
        type: Date,
    },
    'DATA NASC.': {
        prop: 'birth_date',
        type: Date,
    },
};

export default { schema };