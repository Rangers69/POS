<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Stock extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        check_not_login();
        // check_admin();
    }
    public function stock_in_data()
    {
        $data['row'] = $this->stock_m->get_stock_in()->result();
        $this->template->load('template', 'transaction/stock_in/stock_in_data', $data);
    }

    public function stock_in_add()
    {
        $item = $this->item_m->get()->result();
        $supplier = $this->supplier_m->get()->result();
        $data = ['item' => $item, 'supplier' => $supplier];
        $this->template->load('template', 'transaction/stock_in/stock_in_form', $data);
    }

    public function stock_out_data()
    {
        $data['row'] = $this->stock_m->get_stock_out()->result();
        $this->template->load('template', 'transaction/stock_out/stock_out_data', $data);
    }

    public function stock_out_add()
    {
        $item = $this->item_m->get()->result();
        $qty = $this->stock_m->get_stock_out()->result();
        $data = ['item' => $item, 'stock' => $qty];
        $this->template->load('template', 'transaction/stock_out/stock_out_form', $data);
    }

    public function stock_in_del()
    {
        $stock_id = $this->uri->segment(4);
        $item_id = $this->uri->segment(5);
        $qty = $this->stock_m->get($stock_id)->row()->qty;
        $data = ['qty' => $qty, 'item_id' => $item_id];

        $this->item_m->update_stock_out($data);
        $this->stock_m->del($stock_id);
        if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('success', 'Data Stock-In berhasil diupdate');
        }
        redirect('stock/in');
    }

    public function stock_out_del()
    {
        $stock_id = $this->uri->segment(4);
        $item_id = $this->uri->segment(5);
        $qty = $this->stock_m->get($stock_id)->row()->qty;
        $data = ['qty' => $qty, 'item_id' => $item_id];

        $this->item_m->update_stock_in($data);
        $this->stock_m->del($stock_id);
        if ($this->db->affected_rows() > 0) {
            $this->session->set_flashdata('success', 'Data Stock-Out berhasil diupdate');
        }
        redirect('stock/out');
    }
    public function process()
    {
        if (isset($_POST['in_add'])) {
            $post = $this->input->post(null, TRUE);
            $this->stock_m->add_stock_in($post);
            $this->item_m->update_stock_in($post);

            if ($this->db->affected_rows() > 0) {
                $this->session->set_flashdata('success', 'Data Stock-In berhasil disimpan');
            }
            redirect('stock/in');
        } else if (isset($_POST['out_add'])) {
            $post = $this->input->post(null, TRUE);

            if ($post['qty'] > $post['stock']) {
                $this->session->set_flashdata('error', "Qty melebihi stok barang");
                redirect('stock/out/add');
            } else { //KEBALIK BAHLUL
                $this->stock_m->add_stock_out($post);
                $this->item_m->update_stock_out($post);
                if ($this->db->affected_rows() > 0)
                    $this->session->set_flashdata('success', 'Data Stock-Out berhasil disimpan');
                redirect('stock/out');
            }
        }
    }
}
