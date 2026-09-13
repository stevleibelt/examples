<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2026-05-27
 * @ref
 *  https://www.php.net/manual/en/language.enumerations.php
 */

enum MyEnum: string
{
  CASE BAR = 'bar';
  CASE DEFAULT = 'There is no foo without a bar';
  CASE FOO = 'foo';
}

function main ()
{
  if (version_compare(PHP_VERSION, '8.0.0', '<')) {
    throw new Exception("This code needs php version 8.0.0. or above.") ;
  }

  echo ':: Dumping all enum cases' . PHP_EOL;
  var_dump(MyEnum::cases());
  echo PHP_EOL;

  echo ':: Use from if the value might not be invalid' . PHP_EOL;
  try {
    $myEnum = MyEnum::from('baz');
  } catch (ValueError $valueError) {
    echo '   Value Error Message: ' . $valueError->getMessage() . PHP_EOL;
  }
  echo PHP_EOL;

  echo ':: Use tryFrom if the value might be invalid' . PHP_EOL;
  $myEnum = MyEnum::tryFrom('baz') ?? MyEnum::DEFAULT;
  var_dump($myEnum);
  echo PHP_EOL;

  echo ':: And finally a working example' . PHP_EOL;
  $bar = MyEnum::from('bar');

  if ($bar == MyEnum::BAR) {
    echo "   \$bar->value: {$bar->value} is equal to MyEnum::BAR->value: " . MyEnum::BAR->value . PHP_EOL;
  } else {
    echo "   \$bar->value: {$bar->value} is not equal to MyEnum::BAR->value: " . MyEnum::BAR->value . PHP_EOL;
  }
}

main();
