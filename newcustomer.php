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
            nouveau client :
        </h1>
        <form>
            <h2>prénom : </h2><input type="text" id="firstname" name="firstname">
            <h2>nom : </h2><input type="text" id="name" name="name">
            <h2>sexe : </h2><select id="title" name="title">
                <option value="mr">Mr.</option>
                <option value="mme">Mme.</option>
            </select>
            <h2>tel. : </h2><input type="text" id="phone" name="phone">
            <h2>email : </h2><input type="text" id="email" name="email">
            <h2>facebook : </h2><input type="text" id="facebook" name="facebook">
            <h2>instagram : </h2><input type="text" id="instagram" name="instagram"><br>
            <button onclick=newData()>enregistrer</button>
            <button onclick=location.href='./clientlist.php'>retour</button>
            <script>
                function newData() {
                    var firstname = document.getElementById("firstname").value;
                    var name = document.getElementById("name").value;
                    var sex = document.getElementById("sex").value;
                    var phone = document.getElementById("phone").value;
                    var email = document.getElementById("email").value;
                    var facebook = document.getElementById("facebook").value;
                    var instagram = document.getElementById("instagram").value;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() {
                        if (this.readyState == 4 && this.status == 200) {
                            alert("client added successfully!");
                            location.href="./clientlist.php";
                        }
                    };
                    xhttp.open("POST", "new.php", true);
                    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    xhttp.send("id="+id+"&firstname="+firstname+"&name="+name+"&sex"+sex"&phone="+phone+"&email="+email+"&facebook="+facebook+"&instagram="+instagram);
                }
            </script>
        </form>
    </body>
</html>