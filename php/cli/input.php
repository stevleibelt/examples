<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-08-20
 */

require_once __DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . 'string' . DIRECTORY_SEPARATOR . 'StringClass.php';

/**
 * Class Input
 */
class Input
{
    /**
     * @var array
     */
    private $arguments;

    /**
     * @var array
     */
    private $longOptions;

    /**
     * @var int
     */
    private $numberOfArguments;

    /**
     * @var array
     */
    private $parameters;

    /**
     * @var array
     */
    private $shortOptions;

    /**
     * @var StringClass
     */
    private $string;

    /**
     * @var array
     */
    private $unhandled;

    /**
     * @param StringClass $string
     * @param array $arguments
     */
    public function __construct(StringClass $string, array $arguments = array())
    {
        $this->longOptions = array();
        $this->parameters = array();
        $this->shortOptions = array();
        $this->string = $string;
        $this->unhandeld = array();

        $this->setArguments($arguments);
    }

    /**
     * @return array
     */
    public function getArguments()
    {
        return $this->arguments;
    }

    /**
     * @return int
     */
    public function getNumberOfArguments()
    {
        return $this->numberOfArguments;
    }

    /**
     * @param string $name
     * @param null $default
     * @return null
     */
    public function getParameterValue($name, $default = null)
    {
        if ($this->hasParameter($name)) {
            $value = $this->parameters[$name];
        } else {
            $value = $default;
        }

        return $value;
    }

    /**
     * @return array
     */
    public function getUnhandled()
    {
        return $this->unhandeld;
    }

    /**
     * @return array
     */
    public function getParameters()
    {
        return $this->parameters;
    }

    /**
     * @param string $name
     * @return bool
     */
    public function hasParameter($name)
    {
        return (isset($this->parameters[$name]));
    }

    /**
     * @param string $name
     */
    public function removeParameters($name)
    {
        if ($this->hasParameter($name)) {
            unset($this->parameters[$name]);
            $this->update();
        }
    }

    /**
     * @return array
     */
    public function getLongOptions()
    {
        return $this->longOptions;
    }

    /**
     * @return array
     */
    public function getShortOptions()
    {
        return $this->shortOptions;
    }

    /**
     * @param $name
     * @return bool
     */
    public function hasLongOption($name)
    {
        return (isset($this->longOptions[$name]));
    }

    /**
     * @param $longOrShortName
     * @return bool
     */
    public function hasOption($longOrShortName)
    {
        $hasOption = $this->hasLongOption($longOrShortName);

        if (!$hasOption) {
            $hasOption = $this->hasShortOption($longOrShortName);
        }

        return $hasOption;
    }

    /**
     * @param $name
     * @return bool
     */
    public function hasShortOption($name)
    {
        return (isset($this->shortOptions[$name]));
    }

    /**
     * @return bool
     */
    public function hasUnhandled()
    {
        return (!empty($this->unhandeld));
    }

    /**
     * @param string $name
     */
    public function removeLongOption($name)
    {
        if ($this->hasLongOption($name)) {
            unset($this->longOptions[$name]);
            $this->update();
        }
    }

    /**
     * @param string $longOrShortName
     */
    public function removeOption($longOrShortName)
    {
        if ($this->hasLongOption($longOrShortName)) {
            unset($this->longOptions[$longOrShortName]);
            $this->update();
        } else if ($this->hasShortOption($longOrShortName)) {
            unset($this->shortOptions[$longOrShortName]);
            $this->update();
        }
    }

    /**
     * @param string $name
     */
    public function removeShortOption($name)
    {
        if ($this->hasShortOption($name)) {
            unset($this->shortOptions[$name]);
            $this->update();
        }
    }

    /**
     * @param array $arguments
     */
    public function setArguments(array $arguments)
    {
        foreach ($arguments as $argument) {
            if ($this->string->startsWith($argument, '--')) {
                $this->longOptions[$this->string->cut($argument, 2)] = true;
            } else if ($this->string->startsWith($argument, '-')) {
                $this->shortOptions[$this->string->cut($argument, 1)] = true;
            } else {
                $parts = explode('=', $argument);
                if (count($parts) > 1) {
                    $name = array_shift($parts);
                    $this->parameters[$name] = implode('=', $parts);
                } else {
                    $this->unhandeld[] = $argument;
                }
            }
        }

        $this->update();
    }

    private function update()
    {
        $this->arguments = array_merge($this->parameters, $this->shortOptions, $this->longOptions, $this->unhandeld);
        $this->numberOfArguments = count($this->arguments);
    }
}
