<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2017-01-30
 */

function sliceSection ($string, $start, $end)
{
    $positionOfTheStart         = strpos($string, $start);
    $positionOfTheStartIsValid  = ($positionOfTheStart !== false);
    $section                    = null;

    if ($positionOfTheStartIsValid) {
        $positionOfTheStartWithLengthOfStart    = $positionOfTheStart + strlen($start);
        $lengthOfTheSection                     = strpos($string, $end, $positionOfTheStartWithLengthOfStart) - $positionOfTheStartWithLengthOfStart;   //start searching for $end at $positionOfTheStartWithLengthOfStart and subtract the length of the string including the end of $start

        $section = substr($string, $positionOfTheStartWithLengthOfStart, $lengthOfTheSection);
    }

    return $section;
}


$string = 'bar foo foobar : there is no : foo without a bar';

echo 'string: >>' . $string . '<<' . PHP_EOL;

echo 'section between >>there<< and >>foo<<' . PHP_EOL;
echo '  >>' . sliceSection($string, 'there', 'foo') . '<<' . PHP_EOL;
