####
# Example checking current datetime against a list of
#   threshold
####
# @since: 2025-09-11
# @author: stev leibelt <artodeto@bazzline.net>
####

from datetime import datetime, time, timedelta

def main() -> None:
    current_datetime: datetime = datetime.now()
    threshold_time_list: list[time] = [time(hour=h, minute=15) for h in [6, 9, 12, 15, 18]]

    calculated_datetime: datetime = datetime.combine(date=(current_datetime + timedelta(days=1)), time=threshold_time_list[0])

    for threshold_time in threshold_time_list:
        if current_datetime.time() < threshold_time:
            calculated_datetime = datetime.combine(date=current_datetime.date(), time=threshold_time)
            break

    print(f":: {current_datetime=}")
    print(f":: {calculated_datetime=}")


if __name__ == "__main__":
    main()
