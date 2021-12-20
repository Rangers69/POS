<section class="content-header">
    <h1>Items
        <small>Data Barang</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i></a></li>
        <li class="active">Items</li>
    </ol>
</section>
<!-- Main Content -->
<section class="content">
    <?php $this->view('messages') ?>
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">Data Product Items</h3>
            <div class="pull-right">
                <a href="<?= base_url('item/add') ?>" class="btn btn-primary">
                    <i class="fa fa-plus"></i> Create Product Items
                </a>
            </div>
        </div>
        <div class="box-body table-responsive">
            <!-- <?= print_r($row->result()) ?> -->
            <table class="table table-bordered table-striped" id="table1">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Barcode</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Unit</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- <?php $no = 1;
                            foreach ($row->result() as $key => $data) {
                            ?>
                        <tr>
                            <td style="width: 4%;"><?= $no++ ?>.</td>
                            <td>
                                <a href="<?= base_url('item/barcode/' . $data->item_id) ?>" class="btn btn-default btn-xs">
                                    Generator <i class="fa fa-barcode"></i>
                                </a>
                                <br>
                                <?= $data->barcode ?>
                            </td>
                            <td><?= $data->name ?></td>
                            <td><?= $data->category_name ?></td>
                            <td><?= $data->unit_name ?></td>
                            <td><?= $data->price ?></td>
                            <td><?= $data->stock ?></td>
                            <td>
                                <?php if ($data->image != null) { ?>
                                    <img src="<?= base_url('uploads/product/' . $data->image) ?>" style="width:70px">
                                <?php } ?>
                            </td>
                            <td width="160px" class="text-center">
                                <a href="<?= base_url('item/edit/' . $data->item_id) ?>" class="btn btn-primary btn-xs">
                                    <i class="fa fa-pencil"></i> Update
                                </a>
                                <a href="<?= base_url('item/del/' . $data->item_id) ?>" onclick="return confirm('Data Akan dihapus?')" class="btn btn-danger btn-xs">
                                    <i class="fa fa-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    <?php } ?> -->
                </tbody>
            </table>
        </div>
    </div>
</section>
<script>
    $(document).ready(function() {
        $('#table1').DataTable({
            "processing": true,
            "serverside": true,
            "ajax": {
                "url": " <?= base_url('item/get_ajax') ?>",
                "type": "POST"
            },
            "columnDefs": [{
                    "targets": [5, 6],
                    "className": 'text-right'
                },
                {
                    "targets": [0, 7, 8],
                    "className": 'text-center',
                    "orderable": false
                }

            ],
            "order": []
        })
    })
</script>