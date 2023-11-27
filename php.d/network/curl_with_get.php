<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2015-07-28
 */

$queries    = array(
    'artodeto',
    'bazzline',
    'php',
    '[foobar]',
    '\[baz\]'
);
$host        = 'https://duckduckgo.com/?q=';
$urls       = array();

foreach ($queries as $query) {
    $url    = prepareUrl($host . $query);
    $urls[] = $url;
}

//if you want to test the timeout, add an url where a script like the following 
//is running
//@link 
//https://github.com/stevleibelt/examples/commit/2e6dea7938efa70828b5078868c7c671aa4743ca
//$urls[] = 'http://<host>/test_timeout.php?wait=10';

foreach ($urls as $url)
{
    echo 'calling url: ' . $url . PHP_EOL;

    try {
        $response = callUrl($url);
    } catch (Exception $exception) {
        echo $exception->getMessage() . PHP_EOL;
    }

    //echo var_export($response, true) . PHP_EOL;
}

/**
 * @param string $url
 * @return null|string
 */
function callUrl($url)
{
    $curl = curl_init();
    curl_setopt_array(
        $curl,
        array(
            CURLOPT_TIMEOUT         => 4,
            CURLOPT_HTTPGET         => true,
            CURLOPT_RETURNTRANSFER  => true,
            CURLOPT_URL             => $url
        )
    );
    $response = curl_exec($curl);
    if (curl_errno($curl) != 0) {
        $message = 'url: ' . $url . ' created an error' . PHP_EOL . 
            'error number: ' . curl_errno($curl) . PHP_EOL . 
            'error message: ' . curl_error($curl);

        throw new Exception($message);
    }
    curl_close($curl);

    return $response;
}

/**
 * we have to prevent "curl: (3) [globbing] illegal character in range specification at pos"
 *
 * @param string $url
 * @return string
 */
function prepareUrl($url)
{
    $sanitizedUrl   = str_replace(
        array('[', ']', '\\\\', '\\\\'),
        array('\[', '\]', '\\', '\\'),
        $url
    );
    $trimmedUrl     = trim($sanitizedUrl);
    $preparedUrl    = $trimmedUrl;

    return $preparedUrl;
}
