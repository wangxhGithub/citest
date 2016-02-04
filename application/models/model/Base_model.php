<?php
if (! defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * 基类模块
 */
class Base_model extends CI_Model
{

    protected $error = '';

    protected $code = '';

    protected static $masterBbPool = NULL;

    protected static $slaveDbPool = NULL;

    /**
     * 构造函数
     */
    public function __construct()
    {
        parent::__construct();
    }
    
    /**
     * 获取数据库链接
     */
    protected static function getConn($type)
    {
        if ($type == 'master') {
            if (! isset(self::$masterBbPool) || empty(self::$masterBbPool)) {
                self::$masterBbPool = get_instance()->load->database($type, TRUE);
                return self::$masterBbPool;
            } else {
                return self::$masterBbPool;
            }
        } elseif ($type == 'slave') {
            if (! isset(self::$slaveDbPool) || empty(self::$slaveDbPool)) {
                self::$slaveDbPool = get_instance()->load->database($type, TRUE);
                return self::$slaveDbPool;
            } else {
                return self::$slaveDbPool;
            }
        }

        return NULL;
    }

}

/* End of file base_model.php */
/* Location: ./application/models/model/base_model.php */