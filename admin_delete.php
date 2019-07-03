<?php

include ('db/config.php');

    $id=$_REQUEST['id'];
    $query = "DELETE FROM employees WHERE company_id = '$id'"; 
    $result = mysqli_query($mysqli,$query) or die ( mysqli_error($mysqli));
    header("Location: admin_control.php"); 
    
?>