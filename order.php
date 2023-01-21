<!DOCTYPE html>
<html>
    <head>
        <title>Fiche clients</title>
        <?php
			include("utilities.php");
        ?>
    </head>
    <body>
        <?php
            if(isset($_GET["id"]))
                $recherche = $_GET["id"];
            else
                $recherche = '';
            $Connect = fconnect();
            $lien = "SELECT name,firstname,sex FROM customer WHERE id_customer=(SELECT DISTINCT id_customer FROM client_order WHERE id_order='$recherche');";
            $resulta = $Connect->query ($lien);
            $row = mysqli_fetch_assoc($resulta);
            $name = $row['name'];
            $firstname = $row['firstname'];
            $sex = $row['sex'];
            echo "<h1>Commande numero $recherche de $sex $firstname $name"
        ?>
    </body>
</html>