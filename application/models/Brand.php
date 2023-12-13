<?php
class Brand extends CI_Model {
    function getBrands()
	{
        $this->db->select('*');
		$this->db->from('brands');
		return $this->db->get()->result_array();
	}

	function create_brand($brand_name){
		if ($brand_name)
		{
			if($this->db->insert('brands',array('brand_name' => $brand_name)))
			{
				return $this->db->insert_id();
			}
		}
		return FALSE;
	}

	function update_brand($brand_id, $brand_name)
	{
		$this->db->where('brand_id', $brand_id);
		$update_data = array('brand_name' => $brand_name);
					
		if ($this->db->update('brands',$update_data))
		{
			return $brand_id;
		}

	    return FALSE;
	}

	function check_brandname_exist($brand_name)
	{
		$this->db->where('brand_name',$brand_name);
		$query = $this->db->get('brands');

		if ($query->num_rows() > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
?>