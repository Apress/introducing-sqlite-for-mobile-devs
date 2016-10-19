 <html>
 <head>
 </head>
 <body>
 <?php

  $db = 'sqlite:sqlitephp.sqlite';
  $sqlite = new PDO($db) or die ("<h1>Can't open database</h1>");
  echo "<p>Success on PDO</p>";
 
  $query = $sqlite->prepare ("select name, rowid from User;") or die ("<h1>Can't prepare</h1>");
  echo "<p>Success on prepare</p>";
  $query->execute() or die ("Can't execute");
  echo "<p>Success on execute</p>";

  $result  = $query->fetchAll() or die ("Can't fetchAll");
  echo "Success on fetchAll<br />"; // for debugging
?>

<h1>Select the user</h1>

<form method="post" action="phpsql2.php">

<?php
  echo "<select name='userid'>"; 
  foreach ($result as $row) {
    echo "<option value = ".$row['rowid'].">".$row['name']."</option>";
    //$name = $row['name']; 

  }
  echo "<input type = 'hidden' name = 'name' value = ".$row['name'].">";
  echo "</select> <br >";
  echo '<input type="submit" value="Submit">';
  echo '</form>';
					 
 ?>
 
 </body>
 </html>
