<?php
use yii\widgets\ActiveForm;
use yii\helpers\Html;
use app\models\AccEntryMain;
use app\models\AccEntryDetail;
use app\models\CaGroup;
use app\models\CompanyMaster;
use kartik\date\DatePicker;
use kartik\widgets\ActiveField as WidgetsActiveField;
use yii\helpers\Url;
use yii\web\View;

/* @var $this yii\web\View */
/* @var $model app\models\CaGroup */

$this->title = 'Balance Sheet';
$this->params['breadcrumbs'][] = ['label' => 'Acc Bank Account', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$this->params['selectedBtn'] = "reports";
$reportName = "Balance Sheet";
$statementTypeID = 1;

/*[START] No.of years */
if(isset($count) && $count!='')
{
	$count = $count;
}
else
{
	$count = '3';
}
/*[END] No.of years */

/*[START] select date */
if(isset($entered_date) && $entered_date!='')
{
	$value = $entered_date;
}
else
{
	$entered_date = date("Y-03-31");
	$value = date("Y-03-31");
}
/*[END] select date */

$company_name = CompanyMaster::find()->where(['id' => 1])->one()->company_legal_name;

/*[START] get sum of amount*/
function getEntryAmountSum($code, $year, $MonthDate)
{
	$entryamountsum = Yii::$app->db->createCommand("SELECT IFNULL(SUM(IF(ca_group.`code` > 20000, IF(acc_entry_detail.dr_cr = 'C', 1, -1), IF(acc_entry_detail.dr_cr = 'C', -1, 1))*entry_amount),0) 
													FROM acc_entry_detail 
													INNER JOIN acc_entry_main ON acc_entry_detail.entry_id = acc_entry_main.entry_id
													INNER JOIN ca_group ON acc_entry_detail.char_of_acc_id = ca_group.id
													WHERE char_of_acc_id = ".$code." AND (acc_entry_main.entry_date BETWEEN '".($year-1)."-".$MonthDate."' AND '".$year."-".$MonthDate."')")
													->queryScalar();	
	return $entryamountsum;																				
}
/*[END] get sum of amount*/

/*[START] get parent(level 1)*/
$parents = CaGroup::find()
->where(['statement_type_id' => $statementTypeID, 'parent_id' => NULL])
->all();
/*[END] get parent(level 1)*/

?>

<style type="text/css">
	.trial-balance-create h1{
	    margin-bottom: 20px;
	    font-size: 25px;
		text-align: center;
	    text-transform: uppercase;
	}

	.table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
		padding: 1px;
	}	
</style>

<div class="trial-balance-create">

    <div class="admin-form theme-primary mw1000 center-block">

		<div class="panel-body bg-light">
			<?php $form = ActiveForm::begin(array('id'=>'my-form')); ?>

			<div class="form-group">

				<div class="col-sm-2" style="padding-top: 10px;">No. of Years</div>
				<div class="col-sm-2">
					<input type="number" name="count" class="form-control" value="<?php echo $count;?>" style="max-width: 50%; text-align: center;">
				</div>

				<div class="col-sm-1" style="padding-top: 10px;">To</div>
				<div class="col-sm-4">
					<?php
					echo DatePicker::widget([
						'name' => 'balance_sheet_year', 
						'value' => $value,
						'options' => ['placeholder' => 'Select Date ...'],
						'pluginOptions' => [
							'format' => 'yyyy-mm-dd',
							'todayHighlight' => true,
							'todayBtn' => true,
							'autoclose' => true
						]
					]);
					?>
				</div>

				<?php $url_encode = 'index.php?r=/accreceiptmain/balance-sheet-pdf&entered_date='.$entered_date.'&count='.$count; ?>

				<div class="col-sm-3">
					<?= Html::submitButton('Process', ['class' => 'btn btn-rounded btn-primary']) ?>
					<a class="btn btn-primary btn-float-right btn-print" href='<?= $url_encode; ?>' target='_blank' title="Print"><i class="fa fa-print" aria-hidden="true"></i></a>
				</div>

			</div>
			<?php ActiveForm::end();?>

			<p style="text-align: center; font-weight: bold; font-size: 25px;"><?= $company_name; ?></p>
			<p style="text-align: center; font-weight: bold;  font-size: 25px;">
			<?php 
			echo $reportName;
			$start = new DateTime($entered_date);
			echo " as at ".$start->format('jS F Y')."</p>";?>


			<table class="table">
				<thead>
					<tr>
						<?php
						$year = explode('-', $entered_date)[0];
						echo "<th>&nbsp;</th>";
						$MonthDate = explode('-', $entered_date)[1]."-".explode('-', $entered_date)[2];

						for($i = $count; $i > 0; $i--)
						{
							$x = $i-1;
							echo "<th style='text-align:right'>" . ($year-$x) . "<br/>Rs.000</th>";
						}		
						?>
					</tr>
				</thead>
				<tbody>

				<?php	
					foreach ($parents as $parent) 
					{
						$parent_name = $parent->parent_name;
						echo "<tr style='background-color: #185fb3; color: #fff'><th>".strtoupper($parent_name)."</th>";

						for($i = $count; $i > 0; $i--)
						{
							$x = $i-1;
							echo "<td></td>";
						}
						echo "</tr>";

						$subQuery = CaGroup::find()
						->select(['parent_id'])
						->where(['ca_level' => 3, 'statement_type_id' => $statementTypeID])
						->andwhere(['like', 'parent_name', $parent_name . '%', false]);

						$level_2 = CaGroup::find()
						->where(['ca_level' => 2, 'statement_type_id' => $statementTypeID, 'parent_name' => $parent_name])
						->andwhere(['in', 'id', $subQuery])
						->all();

						$x1 = '1';
						for($i = $count; $i > 0; $i--)
						{
							$CreateVar2 = 'SumYear'.$x1;
							$$CreateVar2 = 0;
							$x1++;
						}	
						
						foreach ($level_2 as $item_level_2) 
						{
							$level_2_id = $item_level_2->id;
							$item_name_level_2 = $item_level_2->item_name;

							$coa_item = CaGroup::find()
							->where(['parent_id' => $level_2_id , 'statement_type_id' => $statementTypeID, 'ca_level' => 3])
							->all();

							echo "<tr><th style='padding-left: 3%;'>".$item_name_level_2."</th><td></td><td></td></tr>";					

							foreach ($coa_item as $item)
							{
								$count2 = $count;
								$code = $item->id;

								$coa_list = AccEntryDetail::find()->where(['char_of_acc_id' => $code])->all();

								if(!empty($coa_list))
								{
									echo "<tr style='padding: 0px 0px 0px 0px'><td style='padding-left: 5%;'>".$item->item_name."</td>";	
									$x1 = '1';
									for($count2; $count2 > 0; $count2--)
									{
										$x = $count2-1;
										$CreateVar1 = 'AmountYear'.$x1;
										$$CreateVar1 = getEntryAmountSum($code, ($year-$x), $MonthDate);
										
										$CreateVar2 = 'SumYear'.$x1;
										$$CreateVar2 += $$CreateVar1;
										echo "<td class='text-align-right'>".(number_format((float)$$CreateVar1, 0, '.', ',') ==0 ? '-' : number_format((float)$$CreateVar1, 0, '.', ','))."</td>";
										$x1++;
									}
									echo "</tr>";
								}	
							}							

							if($parent->id ==2)
							{
								$nameid2 = $parent->parent_name;
								$x1 = '1';
								$count2 = $count;
								for($count2; $count2 > 0; $count2--)
								{
									$CreateVar2 = 'SumYear'.$x1;
									$CreateVar3 = 'Lyear'.$x1;
									$$CreateVar3 = $$CreateVar2;
									$x1++;
								}
							}
	
							if($parent->id ==3)
							{
								$nameid3 = $parent->parent_name;
								$x1 = '1';
								$count2 = $count;
								for($count2; $count2 > 0; $count2--)
								{
									$CreateVar2 = 'SumYear'.$x1;
									$CreateVar3 = 'ERyear'.$x1;
									$$CreateVar3 = $$CreateVar2;
									$x1++;
								}															
							}
						}
						echo "<tr><th style='font-weight: bold; ".($parent->id ==1 ? 'font-size: 15px;' : '')."'>TOTAL ".strtoupper($parent_name)."</th>";

						$x1 = '1';
						for($i = $count; $i > 0; $i--)
						{
							$CreateVar2 = 'SumYear'.$x1;
							echo "<td class='text-align-right' style='font-weight: bold; border-top: 2px ridge #000; ".($parent->id ==1 ? 'border-bottom: 5px double #000' : '')."'>".(number_format((float)$$CreateVar2, 0, '.', ',') ==0 ? '-' : number_format((float)$$CreateVar2, 0, '.', ','))."</td>";
							$x1++;
						}
						echo "</tr><tr><td></td></tr>";
					}
					echo "<tr><th style='font-weight: bold; font-size: 15px;'>TOTAL ".strtoupper($nameid2)." & ".strtoupper($nameid3)."</th>";
					
					$x1 = '1';
					for($i = $count; $i > 0; $i--)
					{
						$CreateVar2 = 'Lyear'.$x1;
						$CreateVar3 = 'ERyear'.$x1;
						echo "<td class='text-align-right' style='font-weight: bold; border-top: 2px ridge #000; border-bottom: 5px double #000'>".(number_format((float)$$CreateVar2 + $$CreateVar3, 0, '.', ',') ==0 ? '-' : number_format((float)$$CreateVar2 + $$CreateVar3, 0, '.', ','))."</td>";
						$x1++;
					}
					echo "</tr>";

				?>

				</tbody>
			</table>
     	</div>
    </div>

</div>