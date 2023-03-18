<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ExpenseMasterSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Expense Masters';
$this->params['breadcrumbs'][] = $this->title;
$this->params['selectedBtn'] = "admin";
?>
<div class="expense-master-index admin-form theme-primary mw1000 center-block">

    <div class="panel-body bg-light">
        <div class="section-divider mt20 mb40">
          <span> <?= $this->title; ?> </span>
        </div>

        <!-- <h1><?= Html::encode($this->title) ?></h1> -->
        <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

        <p>
            <?= Html::a('Create Expense Master', ['create'], ['class' => 'btn btn-rounded btn-primary']) ?>

            <?= Html::a('Vehicle Expense Master', ['vehicle-expense-master/index'], ['class' => 'btn btn-rounded btn-primary']) ?>
        </p>

        <br>

        <?= GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => 'yii\grid\SerialColumn'],

                'exp_id',
                'expense_category',
                'expense_status',

                ['class' => 'yii\grid\ActionColumn'],
            ],
        ]); ?>
    </div>
</div>
