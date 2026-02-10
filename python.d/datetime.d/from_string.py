####
# Examples creating datetime from strings
####
# @since: 2025-04-09
# @author: stev leibelt <artodeto@bazzline.net>
####

from datetime import datetime, timedelta

def main() -> None:
    absolute_date_string: str = "1949-10-07"
    # strptime -> string parse time
    absolute_datetime = datetime.strptime(absolute_date_string, "%Y-%m-%d")

    print(":: From String")
    print(f"{absolute_date_string=}")
    print(f"{absolute_datetime=}")
    print("")

    relative_date_string: str = "21d"
    relative_days: int = int(relative_date_string[:-1])
    relative_datetime = datetime.now() - timedelta(days=relative_days)

    print(f"{relative_date_string=}")
    print(f"{relative_days=}")
    print(f"{relative_datetime=}")
    print("")

    # strftime -> string format time
    print(":: To String")
    print(f"{relative_datetime.strftime('%Y-%m-%d %H:%M:%S.%f')=}")
    print("")


if __name__ == "__main__":
    main()
