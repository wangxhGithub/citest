<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {
    
    public function index()
    {
        $this->load->model('model/user_model', 'userModel');
        $userInfo = $this->userModel->getUserInfo(array('userId' => 1));
        
        echo json_encode($userInfo);
    }
}

?>