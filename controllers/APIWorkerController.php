<?php


namespace app\controllers;
use Yii;
use yii\web\Controller;
use yii\httpclient\Client; 
use app\models\AccSubContractor;

class APIWorkerController extends \yii\web\Controller
{
    public function actionIndex()
    {
        $dataArray = array('apiName'=>'AccSubContractor');
        $url = 'http://13.229.233.203/apiman/index.php/datalayer/general';

        $this->apiConnection($url, json_encode($dataArray));
        //return $this->render('index'); 
    }

    public function apiConnection($url, $dataArray)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
        //curl_setopt($ch,CURLOPT_VERBOSE,true );
        //curl_setopt($ch,CURLOPT_HEADER,true );
        curl_setopt($ch,CURLOPT_ENCODING,'' );
        curl_setopt($ch,CURLOPT_MAXREDIRS,10 ); 
        curl_setopt($ch,CURLOPT_CUSTOMREQUEST,'POST' );
        curl_setopt($ch,CURLOPT_POSTFIELDS,$dataArray);
        //curl_setopt($ch,CURLOPT_HTTPHEADER,$headers);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, Array("Content-Type: application/json"));
        curl_setopt($ch, CURLOPT_USERPWD,"pms_user:pmsuser");
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        //curl_setopt_array($ch, $options);
        $result = array();
        if(!headers_sent())
        {
            $result = curl_exec($ch);        
        }
        $errors = curl_error($ch);
        $response = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        $jsonData = json_decode($result, true);

        foreach ($jsonData as $data) 
        {
            $AccSubContractor = new AccSubContractor();
            foreach ($data as $key => $value) 
            {
                if($value == '0000-00-00 00:00:00')
                {
                    $value = NULL;
                }

                $AccSubContractor->$key = $value;
            }
            
            if ($AccSubContractor->save(false)) 
            {
                Yii::$app->session->setFlash('success', "Successfully inserted.", true);
            } 
            else 
            {
                Yii::$app->session->setFlash('error', $AccSubContractor->getErrors(), true);
            }
            
            return Yii::$app->response->redirect(['site/index']);
        }
    }
}
