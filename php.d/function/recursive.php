<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-11-08
 */

function recursive($currentNestingLevel = 0, $maximumNestingLevel = 3, $output = '') 
{
    if ($currentNestingLevel < $maximumNestingLevel) {
        $output .= 'current level: ' . $currentNestingLevel . PHP_EOL;;
        $output = call_user_func(__METHOD__, ++$currentNestingLevel, $maximumNestingLevel, $output);
    }

    return $output;
}

echo recursive();
