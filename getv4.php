/*
GetV4: Check IP Service for pfSense
10-APR-2023 - dewdude@pickmy.org
https://git.pickmy.org/dewdude/HEDyn
*/

// Place this file along with getv4.sh in /usr/local/www

<?php
$output = shell_exec('/usr/local/www/getv4.sh');
echo "$output";
?>
