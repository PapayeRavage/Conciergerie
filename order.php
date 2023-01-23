<!DOCTYPE html>
<html>
    <head>
        <title>Commande</title>
        <?php
			include("utilities.php");
        ?>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <?php
            if(isset($_GET["id"]))
                $id_order = $_GET["id"];
            else
            $id_order = '';
            $Connect = fconnect();
            $lien = "SELECT name,firstname,sex FROM customer WHERE id_customer=(SELECT DISTINCT id_customer FROM client_order WHERE id_order='$id_order');";
            $resulta = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resulta);
            $name = $row['name'];
            $firstname = $row['firstname'];
            $sex = $row['sex'];
            echo "<h1>Commande numero $id_order de $sex $firstname $name</h1>";
            $lien = "SELECT date_order,status,price,id_delivery FROM client_order WHERE id_order='$id_order';";
            $resultg = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resultg);
            $date_order = $row['date_order'];
            $status = $row['status'];
            $price = $row['price'];
            $id_delivery = $row['id_delivery'];
            echo "<h2>$id_order</h2>
                <h2>$date_order</h2>
                <h2>$status</h2>";
            echo "<h2>Livraison :<h2>";
            $lien = "SELECT dispatch_date,reception_date,note,id_address FROM delivery WHERE id_delivery=$id_delivery;";
            $resulth = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resulth);
            if($row!=NULL){
                $dispatch_date = $row['dispatch_date'];
                $reception_date = $row['reception_date'];
                $note = $row['note'];
                $id_address = $row['id_address'];
            }
            echo "<h3>date d'envoi : $dispatch_date, date de reception : $reception_date, note : $note";
            $lien = "SELECT street_num,street_name,postal_code,city FROM address WHERE id_address=$id_address;";
            $resulti = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resulti);
            if($row!=NULL){
                $street_num = $row['street_num'];
                $street_name = $row['street_name'];
                $postal_code = $row['postal_code'];
                $city = $row['city'];
                echo "<h3> à : $street_num $street_name $postal_code $city</h3>";
            }
            echo "<h2>dans la commande :</h2><table><tr><td>Produit</td><td>Status</td><td>Prix unitaire</td><td>quantité</td><td>prix</td></tr>";
            $lien = "SELECT DISTINCT item_name, item_amount, price, state FROM inorder JOIN item ON inorder.id_item = item.id_item JOIN status ON inorder.id_status = status.id_status WHERE id_order='ORDER1';";
            $resultj = $Connect->query ($lien);
            if($resultj!=NULL){
                while($row = mysqli_fetch_assoc($resultj)){
                    $item_name = $row['item_name'];
                    $state = $row['state'];
                    $item_price = $row['price'];
                    $item_amount = $row['item_amount'];
                    $total_cost=$item_price*$item_amount;
                    echo "<tr><td>$item_name</td><td>$state</td><td>$item_price €</td><td>$item_amount</td><td>$total_cost €</td></tr>";
                }
            }
            echo "<tr><td></td><td></td><td></td><td>Cout total : </td><td>$price €</td></tr>";
            echo "</table>";
            mysqli_close ($Connect);
        ?>
    </body>
</html>