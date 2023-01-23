<!DOCTYPE html>
<html>
    <head>
        <title>Modifier Client</title>
        <?php
			include("utilities.php");
        ?>
        <link rel="stylesheet" type="text/css" href="style.css">
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
                $lien = "SELECT name,firstname,sex,phone,facebook,instagram,email FROM customer WHERE id_customer=$recherche;";
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
                echo "<h2>prénom : </h2><input type=\"text\" id=\"firstname\" value=\"$firstname\" name=\"firstname\">
                    <h2>nom : </h2><input type=\"text\" id=\"name\" value=\"$name\" name=\"name\">
                    <h2>tel. : </h2><input type=\"text\" id=\"phone\" value=\"$phone\" name=\"phone\">
                    <h2>email : </h2><input type=\"text\" id=\"email\" value=\"$email\" name=\"email\">
                    <h2>facebook : </h2><input type=\"text\" id=\"facebook\" value=\"$facebook\" name=\"facebook\">
                    <h2>instagram : </h2><input type=\"text\" id=\"instagram\" value=\"$instagram\" name=\"instagram\"><br>";
                echo "<button onclick=updateData($recherche)>enregistrer</button>";
                mysqli_close ($Connect);
            ?>
             <script>
                function updateData(id) {
                    var firstname = document.getElementById("firstname").value;
                    var name = document.getElementById("name").value;
                    var phone = document.getElementById("phone").value;
                    var email = document.getElementById("email").value;
                    var facebook = document.getElementById("facebook").value;
                    var instagram = document.getElementById("instagram").value;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            alert("Data updated successfully!");
                            location.href="./customercard.php?id="+id;
                        }
                    };
                    xhttp.open("POST", "update_data.php", true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send("id="+id+"&firstname="+firstname+"&name="+name+"&phone="+phone+"&email="+email+"&facebook="+facebook+"&instagram="+instagram);
                }
            </script>
        </form>
    </body>
</html>