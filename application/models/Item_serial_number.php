<?php
class Item_serial_number extends CI_Model
{

	function get_all($item_id, $can_cache = TRUE)
	{
		if ($can_cache)
		{
			static $cache  = array();
		
			if (isset($cache[$item_id]))
			{
				return $cache[$item_id];
			}
		}
		else
		{
			$cache = array();
		}
		
		$this->db->from('items_serial_numbers');
		$this->db->where('item_id',$item_id);
		$this->db->order_by('id');
		
		$query = $this->db->get();
		$cache[$item_id] = $query->result_array();
		return $cache[$item_id];
		
	}
	
	function save($item_id, $serial_numbers, $serial_number_cost_prices = array(), $serial_number_qty = array(), $serial_number_date = array())
	{
		$this->db->trans_start();
		
		if (empty($serial_number_qty) || count($serial_numbers) != count($serial_number_qty))
		{
			$serial_number_qty = array_fill(0,count($serial_numbers),'');
		}
		
		if (empty($serial_number_cost_prices) || count($serial_number_cost_prices) != count($serial_number_cost_prices))
		{
			$serial_number_cost_prices = array_fill(0,count($serial_number_cost_prices),'');
		}

		if (empty($serial_number_date) || count($serial_numbers) != count($serial_number_date))
		{
			$serial_number_date = array_fill(0,count($serial_numbers),'');
		}
		
		
		$this->delete($item_id);
		
		for($k=0;$k<count($serial_numbers);$k++)
		{
			$serial_number = $serial_numbers[$k];
			if ($serial_number != '')
			{
				$unit_qty = $serial_number_qty[$k];
				$cost_price = $serial_number_cost_prices[$k];
				$date = $serial_number_date[$k];
				
				if($unit_qty === '')
				{
					$unit_qty = NULL;
				}
				
				if($cost_price === '')
				{
					$cost_price = NULL;
				}

				if($date === '')
				{
					$date = NULL;
				}else{
					$date = date('Y-m-d',strtotime($date));
				}
				
				$this->add_serial($item_id, $serial_number,$cost_price, $unit_qty,$date);
			}
		}
				
		$this->db->trans_complete();
		
		return TRUE;
	}
	
	function get_price_for_serial($serial_number)
	{
		$this->db->from('items_serial_numbers');
		$this->db->where('serial_number',$serial_number);
		$row = $this->db->get()->row_array();
		
		if (isset($row['unit_price']) && $row['unit_price'] !== NULL)
		{
			return $row['unit_price'];
		}
		
		return FALSE;
	}
	
	function get_cost_price_for_serial($serial_number)
	{
		$this->db->from('items_serial_numbers');
		$this->db->where('serial_number',$serial_number);
		$row = $this->db->get()->row_array();
		
		if (isset($row['cost_price']) && $row['cost_price'] !== NULL)
		{
			return $row['cost_price'];
		}
		
		return FALSE;
	}
	
	/*
	Deletes one item
	*/
	function delete($item_id)
	{		
		return $this->db->delete('items_serial_numbers', array('item_id' => $item_id));
	}
	
	function delete_serial($item_id, $serial_number)
	{
		return $this->db->delete('items_serial_numbers', array('item_id' => $item_id, 'serial_number' => $serial_number));		
	}
	
	function add_serial($item_id, $serial_number, $cost_price = NULL, $qty = NULL ,$date = NULL)
	{
		return $this->db->replace('items_serial_numbers', array('item_id' => $item_id, 'serial_number' => $serial_number,'cost_price' => $cost_price, 'qty' => $qty, 'date' => $date));
	}
	
	function get_item_id($serial_number)
	{
		$this->db->from('items_serial_numbers');
		$this->db->where('serial_number',$serial_number);

		$query = $this->db->get();

		if($query->num_rows() >= 1)
		{
			return $query->row()->item_id;
		}
		
		return FALSE;
	}
	
	function cleanup()
	{
		$item_serial_numbers_table = $this->db->dbprefix('items_serial_numbers');
		$items_table = $this->db->dbprefix('items');
		return $this->db->query("DELETE FROM $item_serial_numbers_table WHERE item_id IN (SELECT item_id FROM $items_table WHERE deleted = 1)");
	}	
}
?>