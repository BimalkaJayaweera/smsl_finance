<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ExpenseMaster */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="expense-master-form admin-form theme-primary mw1000 center-block">

    <?php $form = ActiveForm::begin(); ?>

    <div class="panel-body bg-light">
        <div class="section-divider mt20 mb40">
            <span> <?= $this->title; ?> </span>            
        </div>

        <div class="section row">   
        	<div class="col-md-6"> 
			    <?= $form->field($model, 'expense_category')->textInput(['maxlength' => true]) ?>
			</div>
		</div>

		<div class="section row">   
        	<div class="col-md-6"> 
				<?= $form->field($model, 'expense_status')->textInput() ?>
			</div>
		</div>

	    <hr class="short alt">

	    <div class="form-group">
	        <div class="bs-component">
	            <div class="col-lg-7 col-xs-12">
	                <div class="bs-component">
	                    <div class="col-lg-3 pull-right">   
	                        <?= Html::submitButton('Save', ['class' => 'btn btn-rounded btn-primary btn-block']) ?>
	                    </div>
	                </div>
	            </div>  

	        </div>
	    </div>

	</div>

    <?php ActiveForm::end(); ?>

</div>
