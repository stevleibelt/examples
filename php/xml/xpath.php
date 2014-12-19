<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-12-19
 */

$string = '<?xml version="1.0" encoding="UTF-8" ?> 
    <rss> 
        <channel> 
            <item> 
                <title><![CDATA[Item One - title]]></title>
            </item> 
            <item> 
                <title><![CDATA[Item Two - title]]></title>
            </item> 
        </channel> 
    </rss>'; 

$xml = simplexml_load_string($string);
$itemsXPath = '//rss//channel//item';

$items = $xml->xpath($itemsXPath);

foreach ($items as $item) {
    echo $item->title . PHP_EOL;
}
