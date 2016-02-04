<?php
if (! defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * 会员数据处理类
 */
class User_dao extends Base_dao
{

    protected $mainTable = 'u_user';

    protected $fields = 'userId,clientId,mobile,interPhoneCode,password,name,nickname,userIcon,type,token,idCardNum,sex,regTime,userStatus,lastLogin,deviceId,areaId,health,appId';

    /**
     * 构造函数
     */
    public function __construct($db)
    {
        parent::__construct($db);
    }

    /**
     * 增加会员
     * 
     * @param $data 会员信息            
     * @return $userId 会员编号
     */
    public function addUser($data)
    {
        $result = FALSE;
        try {
            $saveData = $this->filterData($data);
            $this->db->insert($this->mainTable, $saveData);
            $result = $this->db->insert_id();
        } catch (Exception $e) {
            $this->logError(__METHOD__, $e);
            $errorMsg = '增加会员失败。';
            $errorCode = 'addUserFail';
            $this->error = $this->error ? $this->error : $errorMsg;
            $this->code = $this->code ? $this->code : $errorCode;
            return FALSE;
        }
        
        return $result;
    }

    /**
     * 获取会员信息
     * 
     * @param $data 查询条件            
     * @return $result 会员信息
     */
    public function getUserInfo($data, $selectFields = '')
    {
        $result = FALSE;
        try {
            $this->db->select(! empty($selectFields) ? $selectFields : $this->fields);
            $this->db->from($this->mainTable);
            $this->setWhere($data);
            $query = $this->db->get();
            $result = $query->row_array();
        } catch (Exception $e) {
            $this->logError(__METHOD__, $e);
            $errorMsg = '获取会员信息失败。';
            $errorCode = 'getUserInfoFail';
            $this->error = $this->error ? $this->error : $errorMsg;
            $this->code = $this->code ? $this->code : $errorCode;
            return FALSE;
        }
        
        return $result;
    }

    /**
     * 获取会员数量
     */
    public function getUserNum(array $data)
    {
        $result = FALSE;
        try {
            $this->db->select('COUNT(1) AS count');
            $this->db->from($this->mainTable);
            $this->setWhere($data);
            $result = $this->db->count_all_results();
        } catch (Exception $e) {
            $this->logError(__METHOD__, $e);
            $errorMsg = '获取会员数量失败。';
            $errorCode = 'getUserNumFail';
            $this->error = $this->error ? $this->error : $errorMsg;
            $this->code = $this->code ? $this->code : $errorCode;
            return FALSE;
        }
        
        return $result;
    }

    /**
     * 获取会员列表
     * 
     * @param $data 查询条件            
     * @return $result 会员信息
     */
    public function getUserList(array $data, $pageSize = 0, $offset = 0, $selectFields = '')
    {
        $result = FALSE;
        try {
            $this->db->select(! empty($selectFields) ? $selectFields : $this->fields);
            $this->db->from($this->mainTable);
            $this->setWhere($data);
            
            if (isset($pageSize) > 0 && $offset > 0) {
                $this->db->limit($pageSize, $offset);
            } elseif ($pageSize > 0) {
                $this->db->limit($pageSize);
            }
            
            $this->db->order_by('userId desc');
            $this->db->order_by('regTime', 'desc');
            $query = $this->db->get();
            $result = $query->result_array();
        } catch (Exception $e) {
            $this->logError(__METHOD__, $e);
            $errorMsg = '获取会员列表失败。';
            $errorCode = 'getUserListFail';
            $this->error = $this->error ? $this->error : $errorMsg;
            $this->code = $this->code ? $this->code : $errorCode;
            return FALSE;
        }
        
        return $result;
    }

    /**
     * 更新会员
     * 
     * @param $data 会员信息            
     * @return $result 更新结果
     */
    public function updateUser($updateData, $whereData = array())
    {
        $result = FALSE;
        try {
            $this->setWhere($whereData);
            $result = $this->db->update($this->mainTable, $this->filterData($updateData));
        } catch (Exception $e) {
            $this->logError(__METHOD__, $e);
            $errorMsg = '更新会员失败。';
            $errorCode = 'updateUserFail';
            $this->error = $this->error ? $this->error : $errorMsg;
            $this->code = $this->code ? $this->code : $errorCode;
            return FALSE;
        }
        
        return $result;
    }

    /**
     * 查询符合条件的记录数
     * @param  string  $where  查询的Where条件
     * @return integer
     */
    public function getCount(array $where = [])
    {
        foreach ($where as $field => $value) {
            if (is_array($value)) {
                $this->db->where_in($field, $value);
            }
            else {
                $this->db->where($field, $value);
            }
        }

        $num = $this->db->count_all_results($this->mainTable);

        return $num;
    }
}

/* End of file user_dao.php */
/* Location: ./application/models/user/user_dao.php */