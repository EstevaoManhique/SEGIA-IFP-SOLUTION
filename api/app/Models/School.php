<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class School
 *
 * @property int $id
 * @property string|null $cod_escola
 * @property int $esc_alunos
 * @property int $esc_alunos_homens
 * @property int $esc_alunos_mulheres
 * @property int $esc_alunos_necessitados
 * @property string|null $esc_contacto
 * @property string|null $esc_descricao
 * @property string|null $esc_distrito
 * @property int $esc_docentes
 * @property string|null $esc_endereco
 * @property int $esc_faixa_05
 * @property int $esc_faixa_1115
 * @property int $esc_faixa_1625
 * @property int $esc_faixa_2635
 * @property int $esc_faixa_35
 * @property int $esc_faixa_610
 * @property int $esc_membros_homens
 * @property int $esc_membros_mulheres
 * @property string|null $esc_provincia
 * @property int $esc_salas
 * @property float $esc_saldo
 * @property int $esc_turmas
 *
 * @package App\Models
 */
class School extends Model
{
    protected $table = 'schools';
    public $timestamps = false;

    protected $casts = [
        'esc_alunos' => 'int',
        'esc_alunos_homens' => 'int',
        'esc_alunos_mulheres' => 'int',
        'esc_alunos_necessitados' => 'int',
        'esc_docentes' => 'int',
        'esc_faixa_05' => 'int',
        'esc_faixa_1115' => 'int',
        'esc_faixa_1625' => 'int',
        'esc_faixa_2635' => 'int',
        'esc_faixa_35' => 'int',
        'esc_faixa_610' => 'int',
        'esc_membros_homens' => 'int',
        'esc_membros_mulheres' => 'int',
        'esc_salas' => 'int',
        'esc_saldo' => 'float',
        'esc_turmas' => 'int'
    ];

    protected $fillable = [
        'cod_escola',
        'esc_contacto',
        'esc_descricao',
        'esc_distrito',
        'esc_endereco',
        'esc_provincia',
        'esc_salas',
        'esc_saldo',
    ];
}
