/**
 * @return string
 */
function getCurrentLocale()
{
    if (navigator.languages != undefined) {
        $currentLocale = navigator.languages[0];
    } else {
        $currentLocale = navigator.language;
    }

    return $currentLocale;
}
