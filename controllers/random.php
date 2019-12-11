<?php 

session_start();
include('../views/heading.php');
include('../models/DBConnect.php');
include('../models/DBFunctions.php');

if (!isset($_SESSION['signedInEmail'])){
        header("Location: login.php");
}

$redirect = RandomDeck();

header('Location: ' . $redirect);
