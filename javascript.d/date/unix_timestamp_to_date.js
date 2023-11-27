/**
 * @param int timestamp
 * @return Date
 */
function createDateFromUnixTimestamp(timestamp)
{
    var timestampInMiliseconds = (timestamp * 1000);
    var date = new Date(timestampInMiliseconds);

    return date;
}
