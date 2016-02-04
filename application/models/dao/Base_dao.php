<?php
if (! defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * 基本处理类
 */
class Base_dao
{

    protected $error = '';

    protected $code = '';

    protected $db = null;

    /**
     * 构造函数
     */
    public function __construct($db)
    {
        $this->db = $db;
    }

    /**
     * 处理查询条件
     */
    protected function setWhere($data, $primaryKey = '')
    {
        if (! empty($primaryKey)) {
            if (is_array($data[$primaryKey])) {
                $this->db->where_in($primaryKey, $data[$primaryKey]);
            } else {
                $this->db->where($primaryKey, $data[$primaryKey]);
            }
        } else {
            if (isset($data) && is_array($data) && ! empty($data)) {
                $keys = explode(',', $this->fields);
                foreach ($data as $key => $val) {
                    $key = trim($key);
                    if (stripos($key, ' ')) {
                        list ($keySimple, $tmp) = explode(' ', $key, 2);
                    } else {
                        $keySimple = $key;
                    }
                    
                    if (! in_array($keySimple, $keys)) {
                        continue;
                    }
                    
                    if (is_array($val)) {
                        $this->db->where_in($key, $val);
                    } else {
                        $this->db->where($key, $val);
                    }
                }
            }
        }
    }

    /**
     * 处理添加或者更新的数据
     */
    protected function filterData($data)
    {
        $saveData = array();
        if (isset($data) && is_array($data) && ! empty($data)) {
            $keys = explode(',', $this->fields);
            foreach ($data as $key => $val) {
                if (! in_array($key, $keys)) {
                    continue;
                }
                
                $saveData[$key] = $val;
            }
        }
        
        return $saveData;
    }

}