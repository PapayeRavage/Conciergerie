<?php
    function fconnect(){
        $address="localhost";
        $username="root";
        $password="";
        $database="conciergerie";
        return mysqli_connect ($address, $username, $password, $database);
    };
    function deleteaddress($id) {
        $lien = "DELETE FROM address WHERE id_address = $id;";
    }
?>