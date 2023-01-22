<?php
    include("utilities.php");
    $Connect = fconnect();
    $firstname = $_POST['firstname'];
    $name = $_POST['name'];
    $sex = $_POST['sex']
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $facebook = $_POST['facebook'];
    $instagram = $_POST['instagram'];
    $query = "INSERT INTO `loyalty` (`id_level`) VALUES (1)";
    $Connect->query($query);
    $query = "INSERT INTO `customer` (`name`, `firstname`, `sex`, `phone`, `facebook`, `instagram`, `email`,`id_loyal`) VALUES ('$name', '$firstname', '$sex', '$phone', '$facebook', '$instagram', '$email',(SELECT MAX(id_loyalty) FROM loyalty))";
    $Connect->query($query);
    mysqli_close($Connect);
?>