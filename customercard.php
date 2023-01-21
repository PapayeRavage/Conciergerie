<!DOCTYPE html>
<html>
    <head>
        <title>Fiche clients</title>
        <?php
			include("utilities.php");
        ?>
    </head>
    <body>
        <h1>
            fiche clients :
        </h1>
        <?php 
            if(isset($_GET["id"]))
                $recherche = $_GET["id"];
            else
                $recherche = '';
            $Connect = fconnect();
            $lien = "SELECT name,firstname,sex,phone,facebook,instagram,email,id_loyal FROM customer WHERE id_customer=$recherche;";
            $resulta = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resulta);
            // Extract the data from the row
            $name = $row['name'];
            $firstname = $row['firstname'];
            $sex = $row['sex'];
            $phone = $row['phone'];
            $email = $row['email'];
            $facebook = $row['facebook'];
            $instagram = $row['instagram'];
            $id_loyal = $row['id_loyal'];
            echo "<h2>$sex $firstname $name</h2>
                <h3>tel. : $phone</h3>
                <h3>email : $email</h3>
                <h3>facebook : $facebook</h3>
                <h3>instagram : $instagram</h3>";
            echo "<button onclick=location.href='./customermodif.php?id=$recherche'>modifier</button><br>";
            $lien = "SELECT description,id_level FROM loyalty WHERE id_loyalty=$id_loyal;";
            $resultb = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resultb);
            $description = $row['description'];
            $id_level = $row['id_level'];
            $lien = "SELECT name FROM level WHERE id_level=$id_level;";
            $resultc = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resultc);
            $lname = $row['name'];
            $lien = "SELECT SUM(amount) FROM points WHERE id_loyal=$id_loyal AND (expire_date=NULL OR expire_date<=CURRENT_DATE());";
            $resultd = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resultd);
            $pamount = $row['SUM(amount)'];
            echo "<h2>Fidélité :</h2>
                <h3>niveau : $lname</h3>
                <h3>nombre de points : $pamount</h3>
                <h3>avantages :</h3>
                <ul><li>$description</li>";
            $lien = "SELECT advantage FROM advantage WHERE id_advantage IN (SELECT id_advantage FROM allow WHERE id_level=$id_level);";
            $resulte = $Connect->query ($lien);
            while($row = mysqli_fetch_assoc($resulte)){
                $avantage = $row['advantage'];
                echo "<li>$avantage</li>";
            }
            echo "</ul>";
            $lien = "SELECT id_address,street_num,street_name,postal_code,city FROM address WHERE id_customer=$recherche;";
            $resultf = $Connect->query ($lien);
            echo "<h2>Addresses du client :</h2>
                <table>";
            while($row = mysqli_fetch_assoc($resultf)){
                // Extract the data from the row
                $id_address = $row['id_address'];
                $street_num = $row['street_num'];
                $street_name = $row['street_name'];
                $postal_code = $row['postal_code'];
                $city = $row['city'];
                echo "<tr>
                        <td>$street_num</td>
                        <td>$street_name</td>
                        <td>$postal_code</td>
                        <td>$city</td><br>
                    </tr>";
            }
            echo "</table>
                <h2>Commandes :</h2>
                <table>";
            $lien = "SELECT id_order,date_order,status,price,id_delivery FROM client_order WHERE id_customer=$recherche;";
            $resultg = $Connect->query ($lien);
            while($row = mysqli_fetch_assoc($resultg)){
                $id_order = $row['id_order'];
                $date_order = $row['date_order'];
                $status = $row['status'];
                $price = $row['price'];
                $id_delivery = $row['id_delivery'];
                echo "<tr>
                        <td>$id_order</td>
                        <td>$date_order</td>
                        <td>$status</td>
                        <td>$price</td>
                    ";
                $lien = "SELECT dispatch_date,reception_date,note,id_address FROM delivery WHERE id_delivery=$id_delivery;";
                $resulth = $Connect->query ($lien);
                $row2 = mysqli_fetch_assoc($resulth);
                if($row2!=NULL){
                    $dispatch_date = $row2['dispatch_date'];
                    $reception_date = $row2['reception_date'];
                    $note = $row2['note'];
                    $id_address = $row2['id_address'];
                }
                $lien = "SELECT street_num,street_name,postal_code,city FROM address WHERE id_address=$id_address;";
                $resulti = $Connect->query ($lien);
                $row3 = mysqli_fetch_assoc($resulti);
                if($row3!=NULL){
                    $street_num = $row3['street_num'];
                    $street_name = $row3['street_name'];
                    $postal_code = $row3['postal_code'];
                    $city = $row3['city'];
                    echo "<td>livré à : $street_num $street_name $postal_code $city</td>";
                }
                echo "<td><button onclick=location.href='./order.php?id=$id_order'>details</button></td></tr>";
            }
            echo "</table>";
            mysqli_close ($Connect);
        ?>
    </body>
</html>