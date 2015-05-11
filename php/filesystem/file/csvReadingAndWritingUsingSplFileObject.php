<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-05-11 
 */

$path = __DIR__ . '/foo.csv';
$data = array();
$file = new SplFileObject($path, 'w+');
$file->setFlags(SplFileObject::READ_CSV);

echo 'generating content.' . PHP_EOL;

for ($iterator = 0; $iterator < 10; ++$iterator) {
    echo '.';
    $data[] = array(
        'line 1 ' . $iterator,
        'line 2 ' . $iterator,
        'line 3 ' . $iterator,
        'line 4 ' . $iterator
    );
}
echo PHP_EOL;

echo 'writing content.' . PHP_EOL;
foreach ($data as $line) {
    echo '.';
    $file->fputcsv($line);
}
echo PHP_EOL;

$file->rewind();

echo 'using fgetcsv and writing key 13 times.' . PHP_EOL;
for ($iterator = 0; $iterator < 13; ++$iterator) {
    echo $file->key() . ' ';
    $file->fgetcsv();
}
echo PHP_EOL;

$file->rewind();

echo 'using current and writing key 13 times.' . PHP_EOL;
for ($iterator = 0; $iterator < 13; ++$iterator) {
    echo $file->key() . ' ';
    $file->current();
}
echo PHP_EOL;

unset($file);
unlink($path);
