 <html>
 <head>
 </head>
 <body>
 
<?php
  print "POST values<br/>";
    foreach ($_POST as $key => $value) {
      echo "$key &nbsp;&nbsp;&nbsp $value <br />";
    }
    $name = $_POST['name'];
    print "name = $name <br/>";
 
    print "--end POST values<br/>";
    
  $db = 'sqlite:sqlitephp.sqlite';
  $sqlite = new PDO($db) or die ("<h1>Can't open database</h1>");
  echo "<p>Success on PDO</p>";

  echo "userid -- ".$_POST["userid"];
  $useridToFind = $_POST['userid'];
  echo "useridToFind = $useridToFind";
 
  $query = $sqlite->prepare ("SELECT name, score FROM Score s, User u WHERE s.userid = u.rowid AND $useridToFind = s.userid ORDER BY score;") or die ("<h1>Can't prepare</h1>");  
  echo "<p>Success on prepare</p>";
  
  $query->execute() or die ("Can't execute");
  echo "<p>Success on execute</p>";

  $result  = $query->fetchAll() or die ("Can't fetchAll");
  echo "Success on fetchAll<br />"; // for debugging
  
  echo "<h1>Score</h1>"; 
  foreach ($result as $row) {
    $userName = $row['name'];
    echo $row['name'], " - ",  $row['score'];
    echo "<br />";
  }
 
 //print "useridToFind: $useridToFind";
 
  echo '<form method="post" action="phpsql3.php">';
  	echo "<input type='hidden' name='userid' value=$useridToFind>";

    echo '<input type="submit" value="Add a score">';
  echo '</form>';
  
 ?>
 </body>
 
 </html>
