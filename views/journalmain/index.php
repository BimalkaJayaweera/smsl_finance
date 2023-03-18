<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\JournalmainSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Journal Entry';
$this->params['breadcrumbs'][] = $this->title;
$this->params['selectedBtn'] = "journal";
?>
<div class="journal-main-index admin-form theme-primary mw1000 center-block">

    <div class="panel-body bg-light">
        <!-- <div class="section-divider mt20 mb40">
          <span> <?php //$this->title; ?> </span>
        </div>-->

        <!-- <h1><?= Html::encode($this->title) ?></h1> -->
        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

        <p>
            <?= Html::a('Create New Journal Entry', ['create'], ['class' => 'btn btn-rounded btn-primary', 'style' => 'float:right']) ?>        
        </p>
        <br>

        <?php 
            if(isset($dataProvider) && $dataProvider !=null)
            {
                echo 
                GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'columns' => [
                    ['class' => 'yii\grid\SerialColumn'],

                    //'journal_id',
                    'journal_date',
                    'reference_no',
                    'description',
                    //'tot_journal_amount',
                    'tot_journal_dr',
                    'tot_journal_cr',
                    'added_by',
                    'added_date',
                    //'business_id',
                    //'business_duration_id',            

                    ['class' => 'yii\grid\ActionColumn',
                        'template' => '{view} {delete}',  //'{view} {update} {delete}'
                        'buttons' => [
                            'view' => function ($url, $model, $key) {
                                return Html::a('<span class="glyphicon glyphicon-eye-open"></span>', ['/journalmain/invoice', 'id'=>$model->journal_id], [
                                    'target'=>'_blank', 
                                    'data-toggle'=>'tooltip', 
                                    'title'=>'Journal Entry'
                                ]);
                            },
                            /*'update' => function ($url, $model, $key) {
                                return Html::a('<span class="glyphicon glyphicon-pencil"></span>', ['journalmain/update', 'id'=>$model->journal_id],['title' =>'Update']);
                            },*/
                            'delete' => function ($url, $model, $key) {
                                return Html::a('<span class="glyphicon glyphicon-trash"></span>', 
                                ['journalmain/delete', 'id'=>$model->journal_id], [   'data' => [
                                    'confirm' => 'Are you sure you want to delete this item?',
                                    'method' => 'post',
                                ],
                                ],
                                ['title' =>'Delete']);
                            }
                        ]
                    ],
                ],
                ]);
            } 
            ?>
    </div>
</div>
