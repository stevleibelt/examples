<?php
/**
 * Simple .env file loading mechanism in pure PHP
 *
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2026-05-29
 * @ref
 *  https://www.php.net/manual/de/function.parse-ini-file.php
 */

function main ()
{
  $envFilePath = __DIR__ . DIRECTORY_SEPARATOR . '.env';

  if (!is_file($envFilePath)) {
    throw new RuntimeException("File does not exist: {$envFilePath}");
  }

  echo ":: Loading content of \$envFilePath={$envFilePath} regular" . PHP_EOL;
  $env = parse_ini_file($envFilePath);

  echo ":: Dumping content of \$envFilePath={$envFilePath}" . PHP_EOL;
  var_dump($env);

  echo PHP_EOL;

  echo ":: Loading content of \$envFilePath={$envFilePath} with processing sections" . PHP_EOL;
  $env = parse_ini_file($envFilePath, true);

  echo ":: Dumping content of \$envFilePath={$envFilePath}" . PHP_EOL;
  var_dump($env);
}

main();
