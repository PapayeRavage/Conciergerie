<!DOCTYPE html>
<html>
    <head>
        <title>Liste des clients</title>
        <?php
			include("utilities.php");
		?>
    </head>
    <body>
        <h1>
            Liste des clients :
        </h1>
        <form action = "clientlist.php" method="get"><input type="search" placeholder="Entrez un mot-clef" name="the_search"/>
        </form>
        <table>
            <?php 
                if(isset($_GET["the_search"]))
                    $recherche = $_GET["the_search"];
                else
                    $recherche = '';
                $Connect = fconnect();
                $lien = "SELECT id_customer,name,firstname,sex,phone,email FROM customer WHERE name LIKE '%$recherche%' OR firstname LIKE '%$recherche%';";
                $result = $Connect->query ($lien);
                while($row = mysqli_fetch_assoc($result)){
                    // Extract the data from the row
                    $id_customer = $row['id_customer'];
                    $name = $row['name'];
                    $firstname = $row['firstname'];
                    $sex = $row['sex'];
                    $phone = $row['phone'];
                    $email = $row['email'];
                    echo "<tr>
                            <td>$id_customer</td>
                            <td>$name</td>
                            <td>$firstname</td>
                            <td>$sex</td>
                            <td>$phone</td>
                            <td>$email</td>
                            <td><button onclick=location.href='./customercard.php?id=$id_customer'>voir fiche client</button></td>
                        </tr>";
                }
                mysqli_close ($Connect);
            ?>
        </table>
    </body>
</html>