#!/bin/php
<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-06-20
 * @see
 *  https://code.google.com/p/pear-console-progressbar/source/browse/trunk/ProgressBar.php
 *  http://pear.php.net/package/Console_Progressbar
 *  http://ezcomponents.org/docs/api/latest/introduction_ConsoleTools.html#progress-indication
 *  https://github.com/activeingredient/ezComponents/blob/master/ConsoleTools/src/progressbar.php
 */

class ProgressBar
{
    /**
     * @var int
     */
    private $currentStep = 0;

    /**
     * @var bool
     */
    private $isFinished = true;

    /**
     * @var int
     */
    private $totalStepSize;

    /**
     * @var int
     */
    private $totalSteps;

    /**
     * @param int $total
     */
    public function setTotalSteps($total)
    {
        $this->totalSteps = (int) $total;
        $this->calculateNumberOfSteps();
        $this->isFinished = false;
        $this->storeCursorPosition();
    }

    /**
     * @param int $current
     */
    public function update($current)
    {
        if (!$this->isFinished) {
            $this->currentStep = (int) $current;
            $this->resetCursor();
            $this->draw();
        }
    }

    public function draw()
    {
        $numberOfStepDraws = (($this->currentStep * $this->totalStepSize) / $this->totalSteps);
        $numberOfMissingStepDraws = ($this->totalStepSize - $numberOfStepDraws);
        $numberOfWhiteSpacesForCurrentStep = (strlen($this->totalSteps) - strlen($this->currentStep));

        $output = '[';
        $output .= str_repeat('=', floor($numberOfStepDraws));
        $output .= '>';
        $output .= str_repeat(' ', ceil($numberOfMissingStepDraws));
        $output .= '] (';
        if ($numberOfWhiteSpacesForCurrentStep > 0) {
            $output .= str_repeat(' ', $numberOfWhiteSpacesForCurrentStep);
        }
        $output .= $this->currentStep . '/' . $this->totalSteps . ')';

        if ($this->currentStep >= $this->totalSteps) {
            $this->isFinished = true;
        }

        echo $output;
    }

    private function resetCursor()
    {
        echo "\0338";
    }

    private function storeCursorPosition()
    {
        echo "\0337";
    }

    private function calculateNumberOfSteps()
    {   
        $lengthOfTotal = strlen($this->totalSteps);
        $lengthOfAdditionalCharacters = 6; //[] (/)

        $this->totalStepSize = 80 - (2 * $lengthOfTotal) - $lengthOfAdditionalCharacters;
    }
}

$items = array(
    3,4,87,1,23,5,7,8,423,34,12,3432
);
$progressBar = new ProgressBar();

$progressBar->setTotalSteps(count($items));

foreach ($items as $key => $item) {
    $progressBar->update($key);
    sleep(1);
}
echo PHP_EOL;
