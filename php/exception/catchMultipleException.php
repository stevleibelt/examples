<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2017-08-15
 */

class MyFirstException extends Exception
{
}

class MySecondException extends Exception
{
}

try {
    $number = rand(0,2);

    switch ($number) {
        case 0:
            throw new MyFirstException('foo');
            break;
        case 1:
            throw new MySecondException('bar');
            break;
        case 2:
            throw new Exception('there is no foo without a bar');
            break;
       default:
            echo 'No exception raised, number is ' . $number . PHP_EOL;
    }
} catch (MyFirstException $exception) {
    echo 'caught exception of type >>' . get_class($exception) . '<< with message >>' . $exception->getMessage() . '<<' . PHP_EOL;
} catch (MySecondException $exception) {
    echo 'caught exception of type >>' . get_class($exception) . '<< with message >>' . $exception->getMessage() . '<<' . PHP_EOL;
} catch (Exception $exception) {
    echo 'caught exception of type >>' . get_class($exception) . '<< with message >>' . $exception->getMessage() . '<<' . PHP_EOL;
}
