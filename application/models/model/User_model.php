<?php
if (! defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * 会员管理模块
 */
class User_model extends Base_model
{

    /**
     * 构造函数
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 获取会员信息
     * 
     * @param
     *            $userId
     * @param string $selectField            
     */
    public function getUserInfo($where, $selectField = '')
    {
        $this->db = parent::getConn('slave');
        $this->userDao = new User_dao($this->db);
        
        $userInfo = $this->userDao->getUserInfo($where, $selectField);
        if (! $userInfo) {
            $this->error = $this->userDao->error;
            $this->code = $this->userDao->code;
            return FALSE;
        }
        return $userInfo;
    }

}

/* End of file user_model.php */
/* Location: ./application/models/model/user_model.php */