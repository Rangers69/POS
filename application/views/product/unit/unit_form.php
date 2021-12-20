<section class="content-header">
    <h1>Units
        <small> Units Barang</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i></a></li>
        <li class="active">Units</li>
    </ol>
</section>
<!-- Main Content -->
<section class="content">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title"><?= Ucfirst($page) ?>Unit</h3>
            <div class="pull-right">
                <a href="<?= base_url('unit') ?>" class="btn btn-warning">
                    <i class="fa fa-undo"></i> Back
                </a>
            </div>
        </div>
        <div class="box-body">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <form action="<?= base_url('unit/process') ?>" method="post">
                        <div class="form-group">
                            <input type="hidden" value="<?= $row->unit_id ?>" name="id">
                            <label for="">Unit Name <span style="color:red">*</span></label>
                            <input type="text" name="unit_name" value="<?= $row->name ?>" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="<?= $page ?>" class="btn btn-success">
                                <i class="fa fa-paper-plan"></i>Save
                            </button>
                            <button type="reset" class="btn btn-secondary">Reset</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

</section>