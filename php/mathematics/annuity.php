<?php
/**
 * @see
 *  https://en.wikipedia.org/wiki/Annuity
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2016-06-14
 */

//begin of input validation
if ($argc < 4) {
    echo 'invalid number of arguments' . PHP_EOL;
    echo '    ' . basename(__FILE__) . ' <amount to borrow> <rate of interest> <duration in years>' . PHP_EOL;
    exit(1);
}

$amountToBorrow     = $argv[1];
$rateOfInterest     = $argv[2];
$durationInYears    = $argv[3];

if ($rateOfInterest < 10) {
    $rateOfInterestAsFloat = floatval('0.0' . $rateOfInterest);
} else if ($rateOfInterest < 100) {
    $rateOfInterestAsFloat = floatval('0.' . $rateOfInterest);
} else {
    echo 'invalid rate of interest provided, must be less than 100' . PHP_EOL;
    exit(1);
}
//end of input validation

//begin of business logic
$rateOfInterestPlusOneToThePowerOfTheDurationInYears = (
    pow((1 + $rateOfInterestAsFloat), $durationInYears)
);

$annuityPerYear = (int) $amountToBorrow * (
    (
        $rateOfInterestPlusOneToThePowerOfTheDurationInYears * $rateOfInterestAsFloat
    )
    /
    (
        $rateOfInterestPlusOneToThePowerOfTheDurationInYears - 1
    )
);

$rateOfInterestDevidedByHundredPlusOne = (
    1 + ($rateOfInterestAsFloat / 100)
);

$totalAmountOfPaidMoney = $annuityPerYear * $durationInYears;
//end of business logic

//begin of output
$tabSpace = "\t";

echo 'your input' . PHP_EOL;
echo '    amount to borrow:' . $tabSpace . $amountToBorrow . PHP_EOL;
echo '    rate of interest:' . $tabSpace . $rateOfInterest . '%' . PHP_EOL;
echo '    duration in years:' . $tabSpace . $durationInYears . PHP_EOL;
echo str_repeat('----', 8) . PHP_EOL;
echo 'annuity per year:' . str_repeat($tabSpace, 2) . ceil($annuityPerYear) . PHP_EOL;
echo 'annuity per month:' . str_repeat($tabSpace, 2) . ceil(($annuityPerYear / 12)) . PHP_EOL;
echo 'total amount of paid money:' . $tabSpace . ceil($totalAmountOfPaidMoney) . PHP_EOL;
//end of output
