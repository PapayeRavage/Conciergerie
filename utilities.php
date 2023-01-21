<?php
    function fconnect(){
        return mysqli_connect ("localhost", "root", "", "conciergerie");
    };
    function deleteaddress($id) {
        $lien = "DELETE FROM address WHERE id_address = $id;";
    }
?>