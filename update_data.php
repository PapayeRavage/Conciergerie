<?php
    include("utilities.php");
    $Connect = fconnect();
    $id = $_POST['id'];
    $firstname = $_POST['firstname'];
    $name = $_POST['name'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $facebook = $_POST['facebook'];
    $instagram = $_POST['instagram'];
    $query = "UPDATE customer SET firstname='$firstname', name='$name', phone='$phone', email='$email', facebook='$facebook', instagram='$instagram' WHERE id_customer='$id'";
    $Connect->query($query);
    mysqli_close($Connect);
?>