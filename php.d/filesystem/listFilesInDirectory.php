<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2013-04-14
 */

$blackList = array(
  '.',
  '..',
  '.svn',
  '.git'
);

if ($directoryHandle = opendir('.')) {
  while (false !== ($fileName = readdir($directoryHandle))) {
    if (!in_array($fileName, $blackList)) {
        echo $fileName . PHP_EOL;
    }
  }
  closedir($directoryHandle);
}
