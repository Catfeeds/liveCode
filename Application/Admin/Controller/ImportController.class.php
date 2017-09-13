<?php
// +----------------------------------------------------------------------
// | OpenCMF [ Simple Efficient Excellent ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014  All rights reserved.
// +----------------------------------------------------------------------
// | 
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Common\Util\Think\Page;
/**
 * 用户控制器
 * 
 */
class ImportController extends AdminController {

    /**
     * 新增用户
     * 
     */
    public function index() {
        if (IS_POST) {
	        $fileid=I('file',0);
	        if ( !$fileid )
	        {
	        	$this->error('上传文件失败');
	        }
	       
	       $tmpfile=get_upload_info($fileid);
	      
           $this->goods_import(getcwd().$tmpfile['path'],$tmpfile['ext']);
        } else {
            // 使用FormBuilder快速建立表单页面。
            $builder = new \Common\Builder\FormBuilder();
            $builder->setMetaTitle('导入数据') //设置页面标题
                    ->setPostUrl(U('index'))    //设置表单提交地址
                    ->addFormItem('file', 'file', '上传EXCEL','请按照固定格式上传,否则导入失败')
                    //->setAjaxSubmit(false)
                    ->display();
        }
    }

    //导入数据方法
    protected function goods_import($filename, $exts = 'xls') {
	    
        //导入PHPExcel类库，因为PHPExcel没有用命名空间，只能inport导入
        import("Org.Util.PHPExcel");
        //创建PHPExcel对象，注意，不能少了\
        $PHPExcel = new \PHPExcel();
        //如果excel文件后缀名为.xls，导入这个类

        if ($exts == 'xls') {
            import("Org.Util.PHPExcel.Reader.Excel5");
            $PHPReader = new \PHPExcel_Reader_Excel5();
        } else if ($exts == 'xlsx') {
            import("Org.Util.PHPExcel.Reader.Excel2007");
            $PHPReader = new \PHPExcel_Reader_Excel2007();
        }
        //载入文件
        $PHPExcel = $PHPReader->load($filename);
      $totalsheet=$PHPExcel->getSheetCount();
      
  for ($i=0; $i <$totalsheet ; $i++)
  { 
  	   //获取表中的第一个工作表，如果要获取第二个，把0改为1，依次类推
        $currentSheet = $PHPExcel->getSheet($i);
        //获取总列数
        $allColumn = $currentSheet->getHighestColumn();
        //获取总行数
        $allRow = $currentSheet->getHighestRow();
        //循环获取表中的数据，$currentRow表示当前行，从哪行开始读取数据，索引值从0开始
        for ($currentRow = 2; $currentRow <= $allRow; $currentRow++) {
            //从哪列开始，A表示第一列
            for ($currentColumn = 'B'; $currentColumn <= $allColumn; $currentColumn++) {
                //数据坐标
                $address = $currentColumn . $currentRow;
                //读取到的数据，保存到数组$arr中
                $tmpk=$currentRow-1;
                $data[$i][$tmpk][$currentColumn] = $currentSheet->getCell($address)->getValue();
            }
        }
  }
     
       $tmp3=array();
       for ( $i=0; $i <$totalsheet ; $i++ )
       { 
       if ( $data[$i] )
       {
       	 $tmp3=array_merge($tmp3,$data[$i]); 
       }
       
       }
     
       unset($data);
        //2lie
        $this->save_import($tmp3);
    }

    //保存导入数据
    public function save_import($data) {
	    if ( !is_array($data) )
	    {
	    	$this->error('数据导入失败');
	    }
	 
$db=D('Order');
$date=array();
        //add all
        /*foreach ($data as $k => $v) {
           
                $date[$k]['bsh'] = trim($v['B']);
                $date[$k]['fwm'] = trim($v['C']);
                $date[$k]['create_time'] = NOW_TIME;
        }
      
        $result = $db->addAll($date);*/
      //
      //
     
       foreach ($data as $k => $v) {
	       $bsh=trim($v['B']);
            $where['bsh']=$bsh;
            $iscz=$db->where($where)->getField('id');;
            if (!$iscz)
            {
	           $result=1;
            	$date['bsh'] = $bsh;
                $date['fwm'] = trim($v['C']);
                $date['create_time'] = NOW_TIME;
                $db->add($date);
               
            }
               
        }
       
      //
       
       
        //$num=count($data);
        
        if ($result) {
            $this->success('数据导入成功',U('Order/index'));
        } else {
           $this->error('数据导入失败,请检测数据格式或是否重复');
        }
    }

   
}
