<?php

include ('db/config.php');

    $id=$_REQUEST['id'];
    $query = "DELETE FROM payments WHERE company_name = '$id'"; 
    $result = mysqli_query($mysqli,$query) or die ( mysqli_error($mysqli));
    header("Location: index.php"); 
    
?>