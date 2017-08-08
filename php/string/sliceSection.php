<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2017-01-30
 */

/**
 * @param string $haystack
 * @param string $start
 * @param string $end
 * @return string
 */
function sliceSection ($haystack, $start, $end)
{
    $positionOfTheStart         = strpos($haystack, $start);
    $positionOfTheStartIsValid  = ($positionOfTheStart !== false);
    $section                    = null;

    if ($positionOfTheStartIsValid) {
        $positionOfTheStartWithLengthOfStart    = $positionOfTheStart + strlen($start);
        $lengthOfTheSection                     = strpos($haystack, $end, $positionOfTheStartWithLengthOfStart) - $positionOfTheStartWithLengthOfStart;   //start searching for $end at $positionOfTheStartWithLengthOfStart and subtract the length of the string including the end of $start

        $section = substr($haystack, $positionOfTheStartWithLengthOfStart, $lengthOfTheSection);
    }

    return $section;
}


$string = 'bar foo foobar : there is no : foo without a bar';

echo 'string: >>' . $string . '<<' . PHP_EOL;

echo 'section between >>there<< and >>foo<<' . PHP_EOL;
echo '  >>' . sliceSection($string, 'there', 'foo') . '<<' . PHP_EOL;
