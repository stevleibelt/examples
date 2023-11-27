<?php
/**
 * @author stev leibelt <artodeto@bazzline.net>
 * @since 2014-11-15
 */

spl_autoload_register(function($className) {
    $files = array(
        'ClassOne' => true,
        'ClassTwo' => true
    );
    $path = __DIR__ . '/';

    if (isset($files[$className])) {
        require_once $path . $className . '.php';
    }
});
