<?php

class Inventory_snapshot extends CI_Model {

    public function insert($data)
    {
        $data['date'] = date('Y-m-d');
        $this->db->insert('inventory_snapshot', $data);
    }
}
 
?>