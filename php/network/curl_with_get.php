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

foreach ($urls as $url)
{
    echo 'calling url: ' . $url . PHP_EOL;
    $response = callUrl($url);

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
            CURLOPT_HTTPGET         => true,    //default curl request is a post
            CURLOPT_RETURNTRANSFER  => true,
            CURLOPT_URL             => $url
        )
    );
    $response = curl_exec($curl);
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
