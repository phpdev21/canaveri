<?php
class Supplier_brands extends CI_Model {

    function getSupplierBrands($supplier_id)
	{
        $this->db->select('supplier_brand_id, brand');
		$this->db->from('supplier_brands');
		$this->db->where('supplier_id',$supplier_id);
		$query = $this->db->get()->result_array();
		return $query;
	}

	function getSupplierBrandsForSelect($supplier_id)
	{
        $this->db->select('supplier_brand_id, brand');
		$this->db->from('supplier_brands');
		$this->db->where('supplier_id',$supplier_id);
		$query = $this->db->get()->result_array();
		foreach($query as $brand){
           $supplier_brand[$brand['supplier_brand_id']] = $brand['brand'];
		}
		return $supplier_brand;
	}

    function update_supplier_brand($supplier_brand_id, $brand_name)
    {
		$this->db->where('supplier_brand_id', $supplier_brand_id);
        if($this->db->update('supplier_brands',array('brand' => $brand_name)))
        {
            return $supplier_brand_id;
        }
		return FALSE;
	}
	
	function insert_supplier_brand($supplier_id, $brand_name)
    {
        if($this->db->insert('supplier_brands',array('supplier_id' => $supplier_id, 'brand' => $brand_name)))
        {
            return $this->db->insert_id();
        }
		return FALSE;
    }
    
    function delete_supplier_brand($supplier_brand_id)
    {
        $this->db->delete('supplier_brands', array('supplier_brand_id' => $supplier_brand_id));
    }

    function check_supplier_brand_exist($supplier_id,$brand_name)
	{
		$query = $this->db->select('supplier_brand_id')->from('supplier_brands')
		->where(array(
			'supplier_id' =>$supplier_id, 
			'brand' => $brand_name
        ))->get();

		if ($query->num_rows() > 0)
		{
			$q = $query->result_array();
			$id = array_column($q,"supplier_brand_id");
			return $id[0];
		}
		else
		{
			return '';
		}
	}
    
}
?>