<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-05-19
 */

$content = <<<EOC
first line
second line
last line
EOC;

echo '----' . PHP_EOL;
echo 'content' . PHP_EOL;
echo '----' . PHP_EOL;
echo $content . PHP_EOL;

echo '----' . PHP_EOL;
echo 'content as array' . PHP_EOL;
echo '----' . PHP_EOL;
echo var_export(explode(PHP_EOL, $content), true) . PHP_EOL;
