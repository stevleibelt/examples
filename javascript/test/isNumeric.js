isNumeric = function(value) {
    var isNumeric = (((value - 0) == value) && (('' + value).trim().length > 0));

    return isNumeric;
}
