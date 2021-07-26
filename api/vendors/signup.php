<?php
    session_start();
    require_once('connect.php');

    $login = "dasda";
    $email = "Dasdas35t";
    $password = "dasdasdda";

    $sql = "INSERT INTO users (login, email, password) VALUES (?, ?, ?)";
    $statement = $connect->prepare($sql);
    $statement->execute([$login, $email, $password]);

    print " ==== POST DATA =====
    Email : $email
    Login  : $login
    Pass  : $password";

    $_SESSION['message'] = 'Регистрация прошла успешно!';
    header('Location: ../../index.php');
?>