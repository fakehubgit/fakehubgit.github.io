

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notifyapp</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <form class="form" action="api/vendors/signup.php" method="post" enctype="multipart/form-data">
            <label for="login">Логин</label>
            <input type="text" name="login" placeholder="Введите свой логин">
            <label for="email">Почта</label>
            <input type="email" name="email" placeholder="Введите свою почту">
            <label for="password">Пароль</label>
            <input type="password" name="password" placeholder="Введите пароль">
            <button type="submit">Зарегистрироваться</button>
        </form>
    </div>
</body>
</html>