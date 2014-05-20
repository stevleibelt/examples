<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-05-19
 * see:
 *      http://stackoverflow.com/questions/4689540/how-to-sftp-with-php
 *      http://php.net/manual/en/function.ssh2-sftp.php
 *      http://www.php.net/manual/en/function.ssh2-connect.php
 *      http://www.php.net/manual/en/function.ssh2-scp-send.php
 *      http://www.sitepoint.com/using-ssh-and-sftp-with-php/
 * alternative:
 *      https://github.com/phpseclib/phpseclib
 */

$localFilePath = '/tmp/sent_file';
$password = '<password>';
$port = 22;
$remoteFilePath = '/tmp/received_file';
$username = '<username>';
$url = '<url>';

$session = ssh2_connect($url, $port);
$isAuthenticated = ssh2_auth_password($session, $username, $password);

if ($isAuthenticated) {
    ssh2_scp_send($session, $localFilePath, $remoteFilePath, 0644)
} else {
    echo 'authentification failed' . PHP_EOL;
}
