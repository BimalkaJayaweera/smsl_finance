<?php

use webvimark\modules\UserManagement\UserManagementModule;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var webvimark\modules\UserManagement\models\User $model
 */

$this->title = UserManagementModule::t('back', 'User creation');
$this->params['breadcrumbs'][] = ['label' => UserManagementModule::t('back', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>



<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header" data-background-color="purple">
                        <h4 class="title"><?= Html::encode($this->title) ?></h4>
                        <p class="category">User Details</p>
                    </div>
                    <div class="card-content">
                        <div class="mschool-list-create">
						    <?= $this->render('_form', compact('model')) ?>
						</div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>