<!DOCTYPE html>
<html>
    <head>
        <title>Your Title Here</title>
        <?php
			include("utilities.php");
        ?>
    </head>
    <body>
        <h1>
            fiche clients :
        </h1>
        <form>
            <?php 
                if(isset($_GET["id"]))
                    $recherche = $_GET["id"];
                else
                    $recherche = '';
                $Connect = fconnect();
                $lien = "SELECT name,firstname,sex,phone,email FROM customer WHERE id_customer=$recherche;";
                $resulta = $Connect->query ($lien);
                $row = mysqli_fetch_assoc($resulta);
                // Extract the data from the row
                $name = $row['name'];
                $firstname = $row['firstname'];
                $sex = $row['sex'];
                $phone = $row['phone'];
                $email = $row['email'];
                echo "<input type="text" id="name" value="$name" name="name">
                    <input type="text" id="name" value="$name" name="name">
                    <h3>$phone</h3>
                    <h3>$email</h3>";
                echo "<button onclick=location.href='./customercard.php?id=$recherche'>enregistrer</button><br>";
                mysqli_close ($Connect);
            ?>
        </form>
    </body>
</html>