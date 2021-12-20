<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Customer extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        check_not_login();
        // check_admin();
    }
    public function index()
    {
        $data['row'] = $this->customer_m->get();
        $this->template->load('template', 'customer/customer_data', $data);
    }

    function get_json() {
        $this->datatables->add_column('no','ID-$1', 'customer_id');
        $this->datatables->select('customer_id,name, gender,phone,address');
        $this->datatables->add_column('action',anchor('customer/edit/$1', 'Update', array('class' => 'btn btn-primary btn-xs'))." ".
        anchor('customer/del/$1', 'Delete', array('class' => 'btn btn-danger btn-xs', 'onclick' => 'return confirm(\'Yakin hapus data?\')')), 'customer_id'  
        );
        $this->datatables->from('customer');
        return print_r($this->datatables->generate());

    }

    public function add()
    {
        $customer = new stdClass();
        $customer->customer_id = null;
        $customer->name = null;
        $customer->gender = null;
        $customer->phone = null;
        $customer->address = null;

        $data = array(
            'page' => 'add',
            'row'  => $customer
        );

        $this->template->load('template', 'customer/customer_form', $data);
    }

    public function edit($id)
    {
        $query = $this->customer_m->get($id);
        if ($query->num_rows() > 0) {
            $customer = $query->row();
            $data = array(
                'page' => 'edit',
                'row' => $customer
            );
            $this->template->load('template', 'customer/customer_form', $data);
        } else {
            echo "<script> alert('Data tidak ditemukan');";
            echo "window.location='" . base_url('customer') . "';</script>";
        }
    }

    public function process()
    {
        $post = $this->input->post(null, TRUE);
        if (isset($_POST['add'])) {
            $this->customer_m->add($post);
            if ($this->db->affected_rows() > 0) {
                echo "<script> alert('Data berhasil ditambahkan');</script>";
            }
            echo "<script>window.location='" . base_url('customer') . "';</script>";
        } else if (isset($_POST['edit'])) {
            $this->customer_m->edit($post);
            if ($this->db->affected_rows() > 0) {
                echo "<script> alert('Data berhasil diubah');</script>";
            }
            echo "<script>window.location='" . base_url('customer') . "';</script>";
        }
    }

    public function del($id)
    {
        $this->customer_m->del($id);
        if ($this->db->affected_rows() > 0) {
            echo "<script>
            alert('Data berhasil dihapus');
            </script>";
        }
        echo "<script>window.location='" . base_url('customer') . "';</script>";
    }
}
