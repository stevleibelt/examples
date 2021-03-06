<?php
//https://en.wikipedia.org/wiki/Email_address#Local_part
//http://www.rfc-base.org/txt/rfc-2822.txt
//https://tools.ietf.org/html/rfc6531#section-3.7.4
//https://tools.ietf.org/html/rfc5322
//http://rumkin.com/software/email/rules.php
//https://bugzilla.mozilla.org/show_bug.cgi?id=614930
//http://trac.roundcube.net/ticket/1490082
//https://github.com/egulias/EmailValidator
//https://github.com/rottingham/EmailValidator/tree/master/src/com/rottingham

//still unfinished
//single quotes are illegal, double quotes are allowed

//ipv4 regex
//
//\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}
//
//ipv6 regex
//
//'#^(?:(?:(?:[\dA-F]{1,4}:){6}(?:[\dA-F]{1,4}:[\dA-F]{1,4}|(?:(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])))|(?:::(?:[\dA-F]{1,4}:){0,5}(?:[\dA-F]{1,4}(?::[\dA-F]{1,4})?|(?:(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])))|(?:(?:[\dA-F]{1,4}:):(?:[\dA-F]{1,4}:){4}(?:[\dA-F]{1,4}:[\dA-F]{1,4}|(?:(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])))|(?:(?:[\dA-F]{1,4}:){1,2}:(?:[\dA-F]{1,4}:){3}(?:[\dA-F]{1,4}:[\dA-F]{1,4}|(?:(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])))|(?:(?:[\dA-F]{1,4}:){1,3}:(?:[\dA-F]{1,4}:){2}(?:[\dA-F]{1,4}:[\dA-F]{1,4}|(?:(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])))|(?:(?:[\dA-F]{1,4}:){1,4}:(?:[\dA-F]{1,4}:)(?:[\dA-F]{1,4}:[\dA-F]{1,4}|(?:(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])))|(?:(?:[\dA-F]{1,4}:){1,5}:(?:[\dA-F]{1,4}:[\dA-F]{1,4}|(?:(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d{1,2}|1\d\d|2[0-4]\d|25[0-5])))|(?:(?:[\dA-F]{1,4}:){1,6}:[\dA-F]{1,4})|(?:(?:[\dA-F]{1,4}:){1,7}:)|(?:::))$#i';
//
//(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))
//
////https://mebsd.com/coding-snipits/php-regex-ipv6-with-preg_match-revisited.html
//$regex = 
//'/^(((?=(?>.*?(::))(?!.+3)))3?|([dA-F]{1,4}(3|:(?!$)|$)|2))(?4){5}((?4){2}|(25[0-5]|(2[0-4]|1d|[1-9])?d)(.(?7)){3})z/i';

/**
 * Class EMailAddress
 */
class EMailAddress
{
    /** @var string */
    private $domainPart;

    /** @var string */
    private $localPart;



    /**
     * EMailAddress constructor.
     *
     * @param $eMailAddress
     * @throws InvalidArgumentException
     */
    public function __construct($eMailAddress)
    {
        $positionOfLastAtCharacter  = strrpos($eMailAddress, '@');
        $noAtCharacterFound         = ($positionOfLastAtCharacter === false);

        if ($noAtCharacterFound) {
            throw new InvalidArgumentException(
                'no @ character found in "' . $eMailAddress . '"'
            );
        }


        $this->domainPart           = substr($eMailAddress, ($positionOfLastAtCharacter + 1));
        $this->localPart            = substr($eMailAddress, 0, ($positionOfLastAtCharacter - 1));
    }



    /**
     * @return string
     */
    public function domainPart()
    {
        return $this->domainPart;
    }



    /**
     * @return string
     */
    public function localPart()
    {
        return $this->localPart;
    }



    /**
     * @param string $domainPart
     * @return EMailAddress
     */
    public function updateDomainPart($domainPart)
    {
        return new self($this->localPart . '@' . $domainPart);
    }



    /**
     * @param string $localPart
     * @return EMailAddress
     */
    public function updateLocalPart($localPart)
    {
        return new self($localPart . '@' . $this->domainPart);
    }



    /**
     * @return string
     */
    public function __toString()
    {
        return $this->localPart . '@' . $this->domainPart;
    }
}

/**
 * Class EMailAddressOptimizer
 */
class EMailAddressOptimizer
{
    /** @var array */
    private $messages;

    /**
     * @param EMailAddress $original
     * @return EMailAddress
     */
    public function optimize(EMailAddress $original)
    {
        $wasOptimized = false;

        //begin of idn to ascii
        if ($this->idnToAsciiPossibleNeeded($original->domainPart())) {
            $this->addMessage('original email address: ' . $original);
            $optimized = $original->updateDomainPart(
                $this->idnToAscii(
                    $original->domainPart()
                )
            );
            $this->addMessage('idn to ascii encoding done for domain part');
            $wasOptimized = true;
        } else {
            $optimized = $original;
        }
        //$optimized = $optimized->updateLocalPart($this->idnToAscii($optimized->localPart()));
        //end of idn to ascii

        $localPartEndsWithADot = $this->endsWith('.', $optimized->localPart());

        if ($localPartEndsWithADot) {
            $optimized = $optimized->updateLocalPart('"' . $optimized->localPart() . '"');
            $wasOptimized = true;
        }

        if ($wasOptimized) {
            $this->addMessage('optimized email address: ' . $optimized);
        }

        return $optimized;
    }



    /**
     * @return array
     */
    public function getMessages()
    {
        return $this->messages;
    }



    /**
     * @return bool
     */
    public function hasMessages()
    {
        return (!empty($this->messages));
    }



    /**
     * @param string $message
     */
    private function addMessage($message)
    {
        $this->messages[] = $message;
    }



    /**
     * @param string $needle
     * @param string $haystack
     * @return bool
     */
    private function endsWith($needle, $haystack)
    {
        return (substr($haystack, -(strlen($needle))) === $needle);
    }



    /**
     * @param string $string
     * @return bool
     */
    private function idnToAsciiPossibleNeeded($string)
    {
        return ($string != $this->idnToAscii($string));
    }



    /**
     * @param string $string
     * @return string
     */
    private function idnToAscii($string)
    {
        return idn_to_ascii($string);
    }



    private function resetRuntimeProperties()
    {
        $this->messages = array();
    }
}

/**
 * Class EMailValidator
 */
class EMailValidator
{
    /**
     * @param EMailAddress $eMailAddress
     */
    public function validate(EMailAddress $eMailAddress)
    {
        $this->throwExceptionIfMultipleAtCharactersAreFound($eMailAddress);
        $this->throwExceptionIfQuotedStringsAreNotDotSeparatedOrTheOnlyElementMakingUpTheLocalPart($eMailAddress);
        $this->throwExceptionIfSpacesQuotesAndBackslashesExistingAndAreNotInsideAnQuotedStringAndPrecededByABackslash($eMailAddress);
        $this->throwExceptionIfSpacesQuotesAndBackslashesArePrecededByABackslashButNotInsideQuotes($eMailAddress);
        $this->throwExceptionIfThereIsMoreThanOneJointDotBeforeTheAtCharacter($eMailAddress);
        $this->throwExceptionIfSpecialCharactersAreOutsideOfQuotationMarks($eMailAddress);
        $this->throwExceptionIfMoreThanOneJointDotAfterTheAtCharacter($eMailAddress);
        $this->throwExceptionIfThereIsAnLeadingSpace($eMailAddress);
        $this->throwExceptionIfIsAnTrailingSpace($eMailAddress);
    }



    /**
     * A@b@c@example.com (only one @ is allowed outside quotation marks)
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfMultipleAtCharactersAreFound(EMailAddress $eMailAddress)
    {
        $parts                  = explode('@', $eMailAddress);
        $numberOfParts          = count($parts);
        $invalidNumberOfParts   = ($numberOfParts != 2);

        if ($invalidNumberOfParts) {
            throw new InvalidArgumentException(
                'unexpected number of @ characters in ' . $eMailAddress
            );
        }
    }



    /**
     * just"not"right@example.com (quoted strings must be dot separated or the only element making up the local-part)
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfQuotedStringsAreNotDotSeparatedOrTheOnlyElementMakingUpTheLocalPart(EMailAddress $eMailAddress)
    {
        $localPart = $eMailAddress->localPart();

        if ($this->contains('"', $localPart)) {
            if (!$this->startsWith('"', $localPart)
                || !$this->endsWith('"', $localPart)) {
                $parts = explode('"', $localPart);

                throw new InvalidArgumentException(
                    '@todo: ' . __METHOD__ . ' ' . var_export($parts, true)
                );
            }
        }
    }



    /**
     * this is"not\allowed@example.com (spaces, quotes, and backslashes may only exist when within quoted strings and preceded by a backslash)
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfSpacesQuotesAndBackslashesExistingAndAreNotInsideAnQuotedStringAndPrecededByABackslash(EMailAddress $eMailAddress)
    {
        $localPart = $eMailAddress->localPart();

        if ($this->startsWith('"', $localPart)) {
            $localPart = $this->cut($localPart, 1);
        }

        if ($this->endsWith('"', $localPart)) {
            $localPart = $this->cut($localPart, 0, -1);
        }

        if ($this->contains('"', $localPart)) {
            throw new InvalidArgumentException(
                '@todo: ' . __METHOD__ . ' ' . var_export($localPart, true)
            );
        }
    }



    /**
     * this\ still\"not\\allowed@example.com (even if escaped (preceded by a backslash), spaces, quotes, and backslashes must still be contained by quotes)
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfSpacesQuotesAndBackslashesArePrecededByABackslashButNotInsideQuotes(EMailAddress $eMailAddress)
    {
    }



    /**
     * john..doe@example.com (double dot before @)
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfThereIsMoreThanOneJointDotBeforeTheAtCharacter(EMailAddress $eMailAddress)
    {
        $localPart = $eMailAddress->localPart();

        if ($this->contains('..', $localPart)) {
            throw new InvalidArgumentException(
                'more than one dot before the at character detected in ' . $localPart
            );
        }
    }



    /**
     * a"b(c)d,e:f;g<h>i[j\k]l@example.com (none of the special characters in this local part are allowed outside quotation marks)
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfSpecialCharactersAreOutsideOfQuotationMarks(EMailAddress $eMailAddress)
    {
    }



    /**
     * john.doe@example..com (double dot after @)
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfMoreThanOneJointDotAfterTheAtCharacter(EMailAddress $eMailAddress)
    {
        $domainPart = $eMailAddress->domainPart();

        if ($this->contains('..', $domainPart)) {
            throw new InvalidArgumentException(
                'more than one dot after the at character detected in ' . $domainPart
            );
        }
    }



    /**
     * a valid address with a leading space
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfThereIsAnLeadingSpace(EMailAddress $eMailAddress)
    {
        if ($this->startsWith(' ', $eMailAddress->localPart())) {
            throw new InvalidArgumentException(
                'leading space detected in ' . $eMailAddress
            );
        }
    }



    /**
     * a valid address with a trailing space
     * @param EMailAddress $eMailAddress
     * @throws InvalidArgumentException
     */
    private function throwExceptionIfIsAnTrailingSpace(EMailAddress $eMailAddress)
    {
        if ($this->endsWith(' ', $eMailAddress->domainPart())) {
            throw new InvalidArgumentException(
                'trailing space detected in ' . $eMailAddress
            );
        }
    }



    /**
     * @param string $needle
     * @param string $haystack
     * @return bool
     */
    private function contains($needle, $haystack)
    {
        return (strpos($haystack, $needle) !== false);
    }



    /**
     * @param string $string
     * @param int $start
     * @param int|null $length
     * @return string
     */
    private function cut($string, $start, $length = null)
    {
        return substr($string, $start, $length);
    }



    /**
     * @param string $string
     * @return int
     */
    private function lengthOf($string)
    {
        return strlen($string);
    }



    /**
     * @param string $needle
     * @param string $haystack
     * @return int
     */
    private function occurs($needle, $haystack)
    {
        return (substr_count($haystack, $needle));
    }




    /**
     * @param string $needle
     * @param string $haystack
     * @return bool
     */
    private function endsWith($needle, $haystack)
    {
        return (substr($haystack, -(strlen($needle))) === $needle);
    }



    /**
     * @param string $needle
     * @param string $haystack
     * @return bool
     */
    private function startsWith($needle, $haystack)
    {
        return ($haystack[0] === $needle);
    }
}
