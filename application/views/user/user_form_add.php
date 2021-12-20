<section class="content-header">
    <h1>Users
        <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i></a></li>
        <li class="active">Users</li>
    </ol>
</section>
<!-- Main Content -->
<section class="content">
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">Add Users</h3>
            <div class="pull-right">
                <a href="<?= base_url('user') ?>" class="btn btn-warning">
                    <i class="fa fa-undo"></i> Back
                </a>
            </div>
        </div>
        <div class="box-body">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <form action="" method="post">
                        <!-- <?php echo validation_errors(); ?> -->
                        <div class="form-group <?= form_error('fullname') ? 'has-error' : null ?>">
                            <label for="">Name <span style="color:red">*</span></label>
                            <input type="text" name="fullname" value="<?= set_value('fullname'); ?>" class="form-control">
                            <span class="help-block"><?php echo form_error('fullname'); ?></span>
                        </div>
                        <div class="form-group <?= form_error('username') ? 'has-error' : null ?>">
                            <label for="">Username <span style="color:red">*</span></label>
                            <input type="text" name="username" value="<?= set_value('username'); ?>" class="form-control">
                            <span class="help-block"><?php echo form_error('username'); ?></span>
                        </div>
                        <div class="form-group <?= form_error('password') ? 'has-error' : null ?>">
                            <label for="">Password <span style="color:red">*</span></label>
                            <input type="password" name="password" value="<?= set_value('password'); ?>" class="form-control">
                            <span class="help-block"><?php echo form_error('password'); ?></span>
                        </div>
                        <div class="form-group <?= form_error('passconf') ? 'has-error' : null ?>">
                            <label for="">Password Confirmation <span style="color:red">*</span></label>
                            <input type="password" name="passconf" value="<?= set_value('passconf'); ?>" class="form-control">
                            <span class="help-block"><?php echo form_error('passconf'); ?></span>
                        </div>
                        <div class="form-group <?= form_error('address') ? 'has-error' : null ?>">
                            <label for="">Address</label>
                            <textarea name="address" class="form-control"><?= set_value('address'); ?></textarea>
                        </div>
                        <div class="form-group <?= form_error('level') ? 'has-error' : null ?>">
                            <label for="">Level <span style="color:red">*</span></label>
                            <select name="level" class="form-control">
                                <option value="">- Pilih -</option>
                                <option value="1" <?= set_value('level') == 1 ? "selected" : null ?>>Admin</option>
                                <option value="2" <?= set_value('level') == 2 ? "selected" : null ?>>Kasir</option>
                            </select>
                            <?php echo form_error('level'); ?>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">
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