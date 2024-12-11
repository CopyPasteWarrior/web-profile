<?php

$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "mail";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $firstname = $conn->real_escape_string($_POST['firstname']);
    $lastname = $conn->real_escape_string($_POST['lastname']);
    $email = $conn->real_escape_string($_POST['email']);
    $message = $conn->real_escape_string($_POST['message']);

    $sql = "INSERT INTO mails (firstname, lastname, email, message) 
            VALUES ('$firstname', '$lastname', '$email', '$message')";

    if ($conn->query($sql) === TRUE) {
        echo "<script>
                alert('Your details have been submitted successfully!');
                window.location.href = 'index.html'; // Redirect to main page
              </script>";
    } else {
        echo "<script>
                alert('Error: " . $conn->error . "');
                window.location.href = 'error_page.php'; // Redirect to error page
              </script>";
    }
}

$conn->close();
?>
