<?php
// Initialize the session
session_start();
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: company_login.php");
    exit;
}
 
// Include config file
require_once "db/config.php";
 
// Define variables and initialize with empty values
$company_name = $pin = "";
$company_name_err = $pin_err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    // Check if company_name is empty
    if(empty(trim($_POST["company_name"]))){
        $company_name_err = "Please enter company_name.";
    } else{
        $company_name = trim($_POST["company_name"]);
    }
    
    // Check if pin is empty
    if(empty(trim($_POST["pin"]))){
        $pin_err = "Please enter your pin.";
    } else{
        $pin = trim($_POST["pin"]);
    }
    
    // Validate credentials
    if(empty($company_name_err) && empty($pin_err)){
        // Prepare a select statement
        $sql = "SELECT id, company_name, company_pin FROM companies WHERE company_name = ?";
        
        if($stmt = $mysqli->prepare($sql)){
            // Bind variables to the prepared statement as parameters
            $stmt->bind_param("s", $param_company_name);
            
            // Set parameters
            $param_company_name = $company_name;
            
            // Attempt to execute the prepared statement
            if($stmt->execute()){
                // Store result
                $stmt->store_result();
                
                // Check if company_name exists, if yes then verify pin
                if($stmt->num_rows == 1){                    
                    // Bind result variables
                    $stmt->bind_result($id, $company_name, $hashed_pin);
                    if($stmt->fetch()){
                        if($pin == $hashed_pin){
                            // pin is correct, so start a new session
                            session_start();
                            
                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["id"] = $id;
                            $_SESSION["company_name"] = $company_name;                            
                            
                            // Redirect user to welcome page
                            header("location: company.php");
                        } else{
                            // Display an error message if pin is not valid
                            $pin_err = "The pin you entered was not valid.";
                        }
                    }
                } else{
                    // Display an error message if company_name doesn't exist
                    $company_name_err = "No account found with that company_name.";
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
            }
        }
        
        // Close statement
        $stmt->close();
    }
    
    // Close connection
    $mysqli->close();
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>E-Tax | Company - Login</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style type="text/css">
        body{ font: 14px sans-serif; }
        .wrapper{ width: 350px; padding: 20px; }
        .no-js #loader { display: none;  }
        .js #loader { display: block; position: absolute; left: 100px; top: 0; }
        .preloader {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background-image: url(images/loader-128x/Preloader_7.gif);
            background-repeat: no-repeat; 
            background-color: #FFF;
            background-position: center;
        }
        body{
            background: url(images/1.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
            color: white;
            }
    </style>
</head>
<body>
    <!-- <div class="preloader"></div> -->
   <div class="container">
       <div class="row">
           <div class="col-md-offset-4 col-md-5">
                <div class="wrapper">
                    <h2>Login</h2>
                    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                        <div class="form-group <?php echo (!empty($company_name_err)) ? 'has-error' : ''; ?>">
                            <label>Company Name</label>
                            <input type="text" name="company_name" class="form-control" value="<?php echo $company_name; ?>">
                            <span class="help-block"><?php echo $company_name_err; ?></span>
                        </div>    
                        <div class="form-group <?php echo (!empty($pin_err)) ? 'has-error' : ''; ?>">
                            <label>Pin</label>
                            <input type="pin" name="pin" class="form-control">
                            <span class="help-block"><?php echo $pin_err; ?></span>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" value="Login">
                        </div>
                    <p>Individual account? <a href="reg.php">Login now</a>.</p>
                    <p>Admin account? <a href="index.php">Admin Only</a>.</p>
                    </form>
                </div>    
           </div>
       </div>
   </div>


   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <script>
        //paste this code under the head tag or in a separate js file.
        // Wait for window load
        $(window).load(function () {
            setTimeout(function(){$('.preloader').fadeOut('slow', function () {});},1500); // set the time here
        });  
        
    </script>


</body>
</html>