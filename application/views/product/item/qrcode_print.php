<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product <?= $row->barcode ?></title>
</head>

<body>
    <img src="uploads/qrcode/item-<?= $row->barcode ?>.png" style="width: 200px;">
    <br>
    <?= $row->barcode ?>
</body>

</html>