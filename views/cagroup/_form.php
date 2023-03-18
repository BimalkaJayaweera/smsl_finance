<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\CaGroup */
/* @var $form yii\widgets\ActiveForm */

use kartik\select2\Select2;
use app\models\StatementType;
use app\models\CaGroup;

$form = ActiveForm::begin( ['options' => ['class' => 'form-horizontal']] );

if(!isset($_GET['level']))
{
  $level = $model->ca_level;
}
else $level = Yii::$app->request->get('level');

if(!isset($_GET['type']))
{
  $type = $model->statement_type_id;
}
else $type = Yii::$app->request->get('type');

if(!isset($_GET['parent']))
{
  $parent = $model->parent_id;
}
else $parent = Yii::$app->request->get('parent');
?> 

  <?= $form->field($model, 'ca_level')->hiddenInput(['value'=> $level])->label(false); ?>

  <div class="panel">
      <div class="panel-heading">
        <span class="panel-title">Update Chart of Account item</span>
      </div>
      <div class="panel-body">
          
          <div class="form-group">  
              <label for="inputInline" class="col-lg-2 control-label">Statement</label>

              <div class="bs-component">
                <div class="col-lg-5">
                  <div class="bs-component">                          
                      <?= $form->field($model, 'statement_type_id')->widget(Select2::classname(), ['data' => ArrayHelper::map(StatementType::find()->all(), 'id', 'statement_type'), 'options' => ['value' => $type]])->label(false);?>
                  </div>
                </div>
              </div>

          </div>


          <div class="form-group">
              <label for="inputInline" class="col-lg-2 control-label">Group</label>

              <div class="bs-component">
                  <div class="col-lg-5">                        
                    <?= $form->field($model, 'parent_id')->widget(Select2::classname(), ['data' => ArrayHelper::map(CaGroup::find()->all(), 'id', 'item_name'), 'options' => ['value' => $parent]])->label(false);?>
                  </div>
              </div>
          </div>                  


          <div class="form-group">
              <label for="inputInline" class="col-lg-2 control-label">Name</label>

              <div class="bs-component">
                <div class="col-lg-5">                        
                  <?= $form->field($model, 'item_name')->textInput(['class' => 'form-control'])->label(false) ?>
                </div>
                <div class="col-lg-2">                          
                  <?= $form->field($model, 'code')->textInput(['class' => 'form-control','placeholder'=>"Code"])->label(false) ?>
                </div>
                <div class="col-lg-3 pl3">
                  <span class="help-block mt3"><i class="fa fa-bell"></i> Code is optional</span>
                </div>
            </div>
          </div>

        <hr class="short alt">

        <div class="form-group">
          <div class="bs-component">
            <div class="col-lg-7">
              <div class="bs-component">
                <div class="col-lg-3 pull-right">                         
                  <button type="submit" class="btn btn-rounded btn-primary btn-block">Save</button>
                </div>
              </div>
            </div> 
          </div>
        </div>
      

      </div>
    </div>

<?php ActiveForm::end(); ?> 