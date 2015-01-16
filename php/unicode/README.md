# unicode handling

## files

* broken.xml            -   contains broken/invalid xml unicode
* broken.xml.cleaned    -   a cleaned version (generated with remove.php)
* detect.php            -   detects invalid characters in each xml files in current working directory
* remove.php            -   detects and removes invalid characters in each xml files in current working directory by creatin a <file name>.cleaned file
* diff.php              -   compares all xml files in current working directory with its <file name>.cleaned ones

## usage / demotime

* run detect.php
* run remove.php
* run diff.php

# links

* http://stackoverflow.com/questions/5742543/an-invalid-xml-character-unicode-0xc-was-found
* http://www.unicode.org/Public/MAPPINGS/VENDORS/APPLE/HEBREW.TXT
* http://blog.mark-mclaren.info/2007/02/invalid-xml-characters-when-valid-utf8_5873.html
* http://www.w3.org/TR/xml/#charsets
* http://stackoverflow.com/questions/2627788/how-do-i-best-remove-the-unicode-characters-that-xhtml-regards-as-non-valid-usin
* https://duckduckgo.com/?q=remove+Unicode%3A+0xc+php+
