<?php

    $connect = new PDO('mysql:host=localhost;dbname=notifyapp', 'sxenguri', '1508');
    
    if (!$connect) {
        die("Error connect to database.");
    }