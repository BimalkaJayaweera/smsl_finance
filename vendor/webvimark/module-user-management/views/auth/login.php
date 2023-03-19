<?php
$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>

<head>
  <link rel="stylesheet" href="css/app.css">
</head>

<style>
	.card .card-body {
    	padding: 15px 35px 10px;
	}

  .login-page .accu-login-form{
      background-color: #fff;
      padding: 20px;
      margin-top: 50px;
      opacity: 0.9;
      border: 2px solid #30363e;
      border-radius: 10px;
  }
  .full-page-background{
    height: 657px;
    background-size: cover;
  }
  /*h3.card-title{
    text-transform: uppercase;
  }*/
  @media(max-width: 767px){
    .full-page-background{
      height: auto !important;
    }
  }

  .header-top{
    width: 100%;
    height: 42px;
  }

  .header-top a{
    float: right;
    margin-right: 100px;
    margin-top: 10px;
    font-size: 12px;
  }

  .header-top a:hover{
    text-decoration: none;
  }

  .navbar-inner{
    height: 60px;
    background-color: #185fb3;
    border-top: 1px solid #DDDDDD;
  }

  .navbar-inner p{
    color: #fff;
    text-align: center;
    font-size: 35px;
    padding: 5px;
  }

  .navbar{
    width: 100%;
    margin: 0 !important;
    border: none;
  }

  .navbar .logo{
    position: absolute;
    margin-left: 30px;
    padding: 20px;
    background-color: #fff;
    border: 10px solid #185fb3;
    border-radius: 30px;
    margin-top: -20px;
    height: 95px;
    width: 120px;
    text-align: center;
  }

  .navbar .logo img{
    top: 3px;
    position: relative;
    max-width: 60px;
    max-height: 30px;
  }

  .login-form-section{    
    padding-top: 70px;
    padding-bottom: 60px;
    height: 555px;
    background: #F4F4F4;
    background-image: url(../web/img/bg4.png);
  }

  .login-page .accu-login-form{
    margin: 50px auto !important;
    float: none;
    border: none !important;
    border-radius: 0;
    box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
  }

  .login-page .card-title{
    margin: -20px -20px 21px;
    line-height: 40px;
    font-size: 15px;
    font-weight: bold;
    color: #424242;
    text-align: center;
    text-shadow: 0 1px white;
    background: #f3f3f3;
    border-bottom: 1px solid #cfcfcf;
    border-radius: 3px 3px 0 0;
  }

  label{
    font-size: 13px !important;
    font-weight: 500 !important;
  }

  span.required {
    color: #FF0000;
  }

  .login-page .accu-login-form .login-btn{
    color: #527881;
    background-color: #cde5ef;
    border-color: #b4ccce #b3c0c8 #9eb9c2;
    border-radius: 30px;
    width: 100px;
  }

  .login-page .accu-login-form .login-btn:hover{
    color: #185fb3;
  }

</style>

<?php 
/**
 * @var $this yii\web\View
 * @var $model webvimark\modules\UserManagement\models\forms\LoginForm
 */

use webvimark\modules\UserManagement\components\GhostHtml;
use webvimark\modules\UserManagement\UserManagementModule;
use yii\bootstrap\ActiveForm;
use app\models\CompanyMaster;
use yii\helpers\Html;

$company_logo = CompanyMaster::find()->where(['id' => 1])->one()->image;
?>

<!-- Start : Header -->
<header> 

    <div class="row header-top">
      <div class="col-sm-12">
        <a href="index.php?r=user-management/auth/login">
          <img src="<?php echo Yii::getAlias('@web').'/img/loginpage_login.png'; ?>">&nbsp;&nbsp;Login
        </a>
      </div>
    </div>

    <div class="row navbar">
      <div class="col-sm-12 navbar-inner">
        <p>MyAccounts</p>
      </div>
      <a href="index.php?r=site/index">
        <div class="logo">
          <img src="<?php echo Yii::getAlias('@web').'/img/'.$company_logo; ?>">
        </div>
      </a>
    </div>

    
    
</header>
<!-- End : Header -->

<div class="login-form-section">

  <?php 
  $form = ActiveForm::begin([
        'id' => 'login-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label}\n<div class=\"col-lg-3\">{input}</div>\n<div class=\"col-lg-8\">{error}</div>",
            'labelOptions' => ['class' => 'col-lg-1 control-label'],
        ],
    ]); ?>

    

  <!-- <div class="full-page-background" style="background-image: url(../assets/img/business-login.jpg)"> -->
  <div class="container">

    <div data-color="black" class="full-page login-page">
      <div class="content">
      <div class="container">
      <div class="row d-flex justify-content-center align-items-center">
      <div class="col-lg-4 col-md-6 col-sm-8 accu-login-form">
      <form method="#" action="#">
         <div class="card" style="opacity: 1; transform: translate3d(0px, 0px, 0px); transition: all 0.3s ease-in 0s;">
            <!----> 
      
            <div class="card-header">
               <div>
                  <h3 class="card-title text-center">Login</h3>
               </div>
            </div>
            <div class="card-body">
               <div>

               <div class="form-group has-label">
                     <label>
                        Username <span class='required'>*</span>
                        <!---->
                     </label>                      
                    <input aria-describedby="addon-right addon-left" placeholder="Enter Username" class="form-control" type="input" name="LoginForm[username]">

                </div>

                <div class="form-group has-label">
                     <label>
                        Password <span class='required'>*</span>
                        <!---->
                     </label>
                     <!----> <input aria-describedby="addon-right addon-left" placeholder="Password" class="form-control" type="password" name="LoginForm[password]"> <!---->  <!---->
                </div>

                <!--div class="form-group">
                     <div class="form-check"><label for="a2a10234c71e5" class="form-check-label">

                     <?= (isset(Yii::$app->user->enableAutoLogin) && Yii::$app->user->enableAutoLogin) ? $form->field($model, 'rememberMe')->checkbox(['value'=>true]) : '' ?>

                     </div>
                     </label>
                </div-->

                </div>
               </div>
               <div class="text-center">
                  <!--button type="submit" class="btn btn-fill btn-info btn-round btn-wd ">Login</button> <br--> 

                  <?= Html::submitButton(
            UserManagementModule::t('front', 'Login'),
            ['class' => 'btn btn-fill btn-info btn-round btn-wd login-btn']
          ) ?>

          
               </div>
            </div>
            <!---->
         </div>
      </form>
  
</div>




</div>
</div>
</div>
</div>
</div>
</div>
</div>

<?php ActiveForm::end(); ?>










