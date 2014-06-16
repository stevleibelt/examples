<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2011-10-21
 */

$workingDir = AddSlashes(dirname(__FILE__));
$dirname = 'test_' . getmypid();
$chmode = 0777;

echo 'current working directory: ' . $workingDir . PHP_EOL;
echo 'owner of the file: ' . fileowner(__FILE__) . PHP_EOL;
echo 'group of the file: ' . filegroup(__FILE__) . PHP_EOL;
clearstatcache();
echo 'permissions of the file: ' . fileperms(__FILE__) .PHP_EOL;
echo PHP_EOL;

if (!file_exists(__DIR__) . $dirname) {
	//changeChmode($workingDir.$dirname.$dirpath, 777);
	if (mkdir(__DIR__ . $dirname, $chmode)) {
        echo 'directory "' . $dirname . '" added' . PHP_EOL;
        if (rmdir(__DIR__ . $dirname)) {
            echo 'removed directory "' . $dirname . '"' . PHP_EOL;
        } else {
            echo 'could not remove directory "' . $dirname . '"' . PHP_EOL;
        }
	} else {
        echo 'could not add directory "' . $dirname . '"' . PHP_EOL;
	}
	//changeChmode($workingDir.$dirname.$dirpath, 760);
} else {
    echo 'directory "' . $dirname . ' already exists' . PHP_EOL;
}

function changeChmode($dirPath, $mode = 755) {
	if(chmod($dirPath, $mode)){
        echo 'changed permissions of "' . $dirPath . '" to "' . $mod . '"';
	}else{
        echo 'could not change permissions of "' . $dirPath . '" to "' . $mod . '"';
	}
}
