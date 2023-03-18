<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "api_worker".
 *
 * @property int $id
 * @property string $base_url
 * @property string $api_username
 * @property string $api_password
 */
class APIWorker extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'api_worker';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'base_url'], 'required'],
            [['id'], 'integer'],
            [['base_url'], 'string', 'max' => 255],
            [['api_username', 'api_password'], 'string', 'max' => 50],
            [['id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'base_url' => 'Base Url',
            'api_username' => 'Api Username',
            'api_password' => 'Api Password',
        ];
    }
}
