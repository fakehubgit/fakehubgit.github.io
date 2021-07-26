<?php

    session_start();
    require_once('connect.php');

    $login = $_POST['login'];
    $password = $_POST['password'];

    $sql = "SELECT * FROM users WHERE login = ? AND password = ?";
    $statement = $connect->prepare($sql);
    $statement->execute(array($login, $password));

    $_SESSION['user'] = $statement->fetchColumn(2);
    if ($_SESSION['user']) {
        echo "<h1>Welcome, " . $_SESSION['user'] . '!</h1>';
    } else {
        echo "Такой пользователь не был найден в базе данных.";
    }

?>