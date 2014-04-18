<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2012-11-15
 */

$targetPathForUploadedFiles = 'files/';
$requestFileName = 'Filedata';
$status = false;

$fileIsSend = (isset($_FILES[$requestFileName])) ? true : false;

if ($fileIsSend) {
  $tempFileName = $_FILES[$requestFileName]['tmp_name'];
  $fileName = $_FILES[$requestFileName]['name'];

  if(move_uploaded_file($tempFileName, $targetPathForUploadedFiles . $fileName)) {
    $status = str_replace($_SERVER['DOCUMENT_ROOT'],'',$fileName);
  } else {
    $status = 'could not upload file';
  }
}

echo $status;
