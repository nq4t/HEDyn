/*
GetV4: Self-Hosted Check IP Service
12-APR-2023 - dewdude@pickmy.org
https://git.pickmy.org/dewdude/HEDyn
*/

// Place this file along with getv4.sh in /usr/local/www on pFSense
// or elsewhere if running on different system. Change script path.
// Change comments for "old" style display if needed.

<?php
$output = shell_exec('/usr/local/www/getv4.sh');
echo "$output";
//echo "Current IP Address: $output";
?>

