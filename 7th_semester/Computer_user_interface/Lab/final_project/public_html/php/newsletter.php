<?php
$newsletter=$_POST['newsletter'];

$email_from="info@nikolaosmelakis.com";

$email_subject="New Newsletter Member";

$email_body="Email: $newsletter.\n".

$to="nick_melakis@yahoo.gr";

$headers="From: $email_from \r\n";

$headers="Reply-to: $visitor_email\r\n";

mail($to,$email_subject,$email_body,$headers);

header("Location: ../index.html");