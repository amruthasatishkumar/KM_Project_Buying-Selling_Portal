!DOCTYPE html>
<?php require_once 'core_admin.php'; ?>
<html lang="en">
<head>
  <title>Buying and Selling Portal</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <!-- Page styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="$$hosted_libs_prefix$$/$$version$$/material.min.css">
    <link rel="stylesheet" href="alert.css">
  
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
</head>
<link href="login_style.css" rel="stylesheet">
<link href="css/divison_style.css" rel="stylesheet">
<link href="timeline.css" rel="stylesheet">
<body >




<nav class="navbar-fixed navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="admin_wall.php">Buying and selling portal admin page</a>
    </div>

    <button class = "navbar-toggle" data-toggle = "collapse" data-target = ".navHeaderCollapse">
    <span class ="icon-bar"></span>
    <span class ="icon-bar"></span>
    <span class ="icon-bar"></span>
    </button>
    <div class="collapse navbar-collapse navHeadeorCollapse">

      <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="admin_wall.php">Home</a></li>

      
     


      <?php 
      if(loggedin_admin())
      {
      		$temp = $_SESSION['username_admin'];
      		echo <<< _END
      		<li><a href="logout.php">Logout</a> 
_END;
      		
      }
      else
      {
      		echo <<< _END
      		
      		<li><a href="admin.php"><span class="glyphicon glyphicon-user"></span>Admin Sign In</a>
_END;
      }
     
      ?>

        <li class="users"><a href="users.php">Users</a></li>
	 </ul>
    </div>  

   
     
  </div>
</nav>


<?php
$dbusername = "root";
$password = "";
$dbname = "khreedo_becho";
$servername = "localhost";

$conn = mysqli_connect($servername, $dbusername, $password , $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT username,name FROM users";
$result=$conn->query($sql);

if($result->num_rows > 0){
  while ($row = $result->fetch_assoc()) {
     echo "username: " . $row["username"]. " - Name: " . $row["name"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>

</body>
</html>
