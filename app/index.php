<?php

$host = "mysql";
$user = "root";
$password = "root123";
$database = "devopsdb";

$conn = new mysqli($host, $user, $password, $database);

?>

<!DOCTYPE html>
<html>
<head>
    <title>Docker & Jenkins CI/CD Assignment (Datagrid)</title>

    <style>

        body{
            font-family: Arial;
            margin:40px;
            background:#f5f5f5;
        }

        h1{
            color:#2c3e50;
        }

        h2{
            color:#34495e;
        }

        .success{
            color:green;
            font-size:20px;
            font-weight:bold;
        }

        table{
            border-collapse:collapse;
            width:80%;
            background:white;
        }

        th,td{
            border:1px solid #ccc;
            padding:12px;
            text-align:left;
        }

        th{
            background:#3498db;
            color:white;
        }

    </style>

</head>

<body>

<h1>Docker & Jenkins Assignment</h1>

<h2>PHP Version : <?php echo phpversion(); ?></h2>

<?php

if($conn->connect_error){

    die("<p style='color:red;'>Database Connection Failed</p>");

}else{

    echo "<p class='success'>Connected to MySQL Successfully</p>";

}

$result = $conn->query("SELECT * FROM employees");

?>

<h2>Employee Details</h2>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Designation</th>
<th>Department</th>
<th>Salary</th>

</tr>

<?php

while($row = $result->fetch_assoc()){

echo "<tr>

<td>".$row['id']."</td>

<td>".$row['name']."</td>

<td>".$row['designation']."</td>

<td>".$row['department']."</td>

<td>".$row['salary']."</td>

</tr>";

}

?>

</table>

</body>

</html>
