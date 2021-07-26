<?php
    session_start();
    require_once('connect.php');

    $sql = "SELECT * FROM users";
    $statement = $connect->query($sql);

    while ($row = $statement->fetch()) {
        echo $row['login']."<br />\n";
    }

    $data = $statement;
    header('Content-Type: application/json');
    echo json_encode($data);