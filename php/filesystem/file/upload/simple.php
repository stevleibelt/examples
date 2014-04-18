<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2012-11-15
 */

$targetPathForUploadedFiles = 'files/';
$requestFileName = 'upload_file';
$status = 'no file available';

$fileIsSend = (isset($_FILES[$requestFileName])) ? true : false;

if ($fileIsSend) {
  $tempFileName = $_FILES[$requestFileName]['tmp_name'];
  $fileName = $_FILES[$requestFileName]['name'];

  if(move_uploaded_file($tempFileName, $targetPathForUploadedFiles . $fileName)) {
    $status = 'file was uploaded';
  } else {
    $status = 'could not upload file';
  }
} else {
  echo xdebug_var_dump($_FILES);
  echo xdebug_var_dump($_POST);
}

echo $status;
