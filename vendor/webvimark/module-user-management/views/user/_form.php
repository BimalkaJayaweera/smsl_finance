<?php

use webvimark\modules\UserManagement\models\User;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
use webvimark\extensions\BootstrapSwitch\BootstrapSwitch;

use kartik\select2\Select2;
use kartik\widgets\DepDrop;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;


use app\models\MSchoolList;
use app\models\MZonalEduList;
use app\models\MProvincialList;


/**
 * @var yii\web\View $this
 * @var webvimark\modules\UserManagement\models\User $model
 * @var yii\bootstrap\ActiveForm $form
 */
?>

<div class="user-form">

	<?php $form = ActiveForm::begin([
		'id'=>'user',
		'layout'=>'horizontal',
		'validateOnBlur' => false,
	]); ?>

	<?= $form->field($model->loadDefaultValues(), 'status')
		->dropDownList(User::getStatusList()) ?>

	<?= $form->field($model, 'username')->textInput(['maxlength' => 255, 'autocomplete'=>'off']) ?>

	<?php if ( $model->isNewRecord ): ?>

		<?= $form->field($model, 'password')->passwordInput(['maxlength' => 255, 'autocomplete'=>'off']) ?>

		<?= $form->field($model, 'repeat_password')->passwordInput(['maxlength' => 255, 'autocomplete'=>'off']) ?>
	<?php endif; ?>


	<?php /* if ( User::hasPermission('bindUserToIp') ): */?>

		<!--?= $form->field($model, 'bind_to_ip')
			->textInput(['maxlength' => 255])
			->hint(UserManagementModule::t('back','For example: 123.34.56.78, 168.111.192.12')) ?-->

	<?php /*endif; */?>

	<?php /* if ( User::hasPermission('editUserEmail') ): */?>

		<!--?= $form->field($model, 'email')->textInput(['maxlength' => 255]) ?-->
		<!--?= $form->field($model, 'email_confirmed')->checkbox() ?-->

	<?php /* endif; */?>

	
	<?php /*echo $form->field($model, 'user_level')->widget(Select2::classname(), [
        'data' => ['school' => 'School', 'zone' => 'Zone', 'province' => 'Province','ministry'=>'Ministry']]);*/ ?>

	<?= $form->field($model, 'user_level')->widget(DepDrop::classname(), [
        'data'=>['school' => 'School', 'zone' => 'Zone', 'province' => 'Province','ministry'=>'Ministry'],
        'options' => ['placeholder' => 'Select ...'],
        'type' => DepDrop::TYPE_SELECT2,
        'select2Options'=>['pluginOptions'=>['allowClear'=>true]],
        'pluginOptions'=>[
            'depends'=>['user-school_level_id'],
            //'url' => Url::to(['/tblbankbranch/load_banks']),
            'url' => Url::to(''),
            'loadingText' => 'Loading ...',
            //'initialize'=> true,
        ]
    ]);

    // Child level 2
    $current_action = $this->context->action->id;
    if($current_action =='update'){ 
    	$my_level = $model->user_level;
    	if($my_level == 'school'){
    		echo $form->field($model, 'level_value')->widget(DepDrop::classname(), [
	        'data'=> ArrayHelper::map(MSchoolList::find()->Where(['status'=>1])->andWhere(['id'=>$model->level_value])->all(), 'id', 'school_name'),
	        'options' => ['placeholder' => 'Select ...'],
	        'type' => DepDrop::TYPE_SELECT2,
	        'select2Options'=>['pluginOptions'=>['allowClear'=>true]],
	        'pluginOptions'=>[
	            'depends'=>['user-user_level'],
	            //'url'=>Url::to(''),
	            'url' => Url::to(['/site/load_user_level_values']),
	            'loadingText' => 'Loading ...',
	            //'initialize'=> true,
	        ]
	        ]);
    	}
	    else if($my_level == 'zone'){
	        echo $form->field($model, 'level_value')->widget(DepDrop::classname(), [
	        'data'=> ArrayHelper::map(MZonalEduList::find()->Where(['status'=>1])->andWhere(['zonal_id'=>$model->level_value])->all(), 'zonal_id', 'zonal_name'),
	        'options' => ['placeholder' => 'Select ...'],
	        'type' => DepDrop::TYPE_SELECT2,
	        'select2Options'=>['pluginOptions'=>['allowClear'=>true]],
	        'pluginOptions'=>[
	            'depends'=>['user-user_level'],
	            'url' => Url::to(['/site/load_user_level_values']),
	            'loadingText' => 'Loading ...',
	            //'initialize'=> true,
	        ]
	        ]);
	    }
	    else if($my_level == 'province'){
	        echo $form->field($model, 'level_value')->widget(DepDrop::classname(), [
	        'data'=> ArrayHelper::map(MProvincialList::find()->Where(['status'=>1])->andWhere(['id'=>$model->level_value])->all(), 'id', 'provincial_name'),
	        'options' => ['placeholder' => 'Select ...'],
	        'type' => DepDrop::TYPE_SELECT2,
	        'select2Options'=>['pluginOptions'=>['allowClear'=>true]],
	        'pluginOptions'=>[
	            'depends'=>['user-user_level'],
	            'url' => Url::to(['/site/load_user_level_values']),
	            'loadingText' => 'Loading ...',
	            //'initialize'=> true,
	        ]
	        ]);
	    }
	    else{
	        echo $form->field($model, 'level_value')->widget(DepDrop::classname(), [
	        'data'=> [''],
	        'options' => ['placeholder' => 'Select ...'],
	        'type' => DepDrop::TYPE_SELECT2,
	        'select2Options'=>['pluginOptions'=>['allowClear'=>true]],
	        'pluginOptions'=>[
	            'depends'=>['user-user_level'],
	            'url' => Url::to(['/site/load_user_level_values']),
	            'loadingText' => 'Loading ...',
	            //'initialize'=> true,
	        ]
	        ]);
	    }
	}
	else{
		echo $form->field($model, 'level_value')->widget(DepDrop::classname(), [
	        'data'=> [],
	        'options' => ['placeholder' => 'Select ...'],
	        'type' => DepDrop::TYPE_SELECT2,
	        'select2Options'=>['pluginOptions'=>['allowClear'=>true]],
	        'pluginOptions'=>[
	            'depends'=>['user-user_level'],
	            //'url'=>Url::to(''),
	            'url' => Url::to(['/site/load_user_level_values']),
	            'loadingText' => 'Loading ...',
	            //'initialize'=> true,
	        ]
	    ]);

	}  





/*
$url = \yii\helpers\Url::to(['city-list']);
// Get the initial city description
 
echo $form->field($model, 'level_value')->widget(Select2::classname(), [
    'initValueText' => 'sasa', // set the initial display text
    'options' => ['placeholder' => 'Search for a city ...'],
    'pluginOptions' => [
        'allowClear' => true,
        'minimumInputLength' => 3,
        'language' => [
            'errorLoading' => new JsExpression("function () { return 'Waiting for results...'; }"),
        ],
        'ajax' => [
            'url' => $url,
            'dataType' => 'json',
            'data' => new JsExpression('function(params) { return {q:params.term}; }')
        ],
        'escapeMarkup' => new JsExpression('function (markup) { return markup; }'),
        'templateResult' => new JsExpression('function(level_value) { return level_value.text; }'),
        'templateSelection' => new JsExpression('function (level_value) { return level_value.text; }'),
    ],
]);
*/













    ?>

	<div class="form-group">
		<div class="col-sm-offset-3 col-sm-9">
			<?php if ( $model->isNewRecord ): ?>
				<?= Html::submitButton(
					'<span class="glyphicon glyphicon-plus-sign"></span> ' . UserManagementModule::t('back', 'Create'),
					['class' => 'btn btn-success']
				) ?>
			<?php else: ?>
				<?= Html::submitButton(
					'<span class="glyphicon glyphicon-ok"></span> ' . UserManagementModule::t('back', 'Save'),
					['class' => 'btn btn-primary']
				) ?>
			<?php endif; ?>
		</div>
	</div>

	<?php ActiveForm::end(); ?>

</div>

<?php BootstrapSwitch::widget() ?>