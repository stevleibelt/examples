#!/bin/php
<?php
/**
 * Switch Case example
 *
 * @since: 2023-02-06
 * @author: stev leibelt <artodeto@bazzline.net>
 */

function _main()
{
  $availableColors = [
    3,
    'black',
    'blue',
    'green',
    'red',
    'white'
  ];

  $randomizedIndex = array_rand($availableColors);
  $currentColor = $availableColors[$randomizedIndex];

  echo ":: Listing available colors as json." . PHP_EOL;
  echo "   " . json_encode($availableColors) . PHP_EOL;
  echo PHP_EOL;
  echo ":: Selected color is >>${currentColor}<<." . PHP_EOL;

  switch ($currentColor) {
    case 'black':
    case 'white':
      echo "   >>${currentColor}<< is not a color." . PHP_EOL;
      break;
    case 'blue':
      echo "   Blue Skies" . PHP_EOL;
      break;
    case 'green':
      echo "   Green is the colour" . PHP_EOL;
      break;
    case 'red':
      echo "   Redheaded Girl" . PHP_EOL;
      break;
    default:
      echo "   >>${currentColor}<< is not supported." . PHP_EOL;
  }

  echo PHP_EOL;
}

_main();

