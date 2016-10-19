 <html>
 <head>
 </head>
 <body>
 
<?php

print "POST values<br/>";
  foreach ($_POST as $key => $value) {
	echo "$key  $value <br />";
  }
  print "--end POST values<br/>";
  $userid = $_POST["userid"];
  print $userid;
  
  $db = 'sqlite:sqlitephp.sqlite';
  $sqlite = new PDO($db) or die ("<h1>Can't open database</h1>");
  echo "<p>Success on PDO</p>";
 
  $query = $sqlite->prepare ("INSERT INTO Score ('score', 'userid') VALUES (99, $userid);") or die ("<h1>Can't prepare</h1>");
  echo "<p>Success on prepare</p>";
  
  $query->execute() or die ("Can't execute");
  echo "<p>Success on execute</p>";

 //$result  = $query->fetchAll() or die ("Can't fetchAll");
   //echo "Success on fetchAll<br />"; // for debugging*/
?>

<h1>New score added</h1> 

 </body>
 </html>
