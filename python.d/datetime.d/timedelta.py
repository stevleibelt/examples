####
# Examples for using timedelta and comparing dates in python
####
# @since: 2024-10-24
# @author: stev leibelt <artodeto@bazzline.net>
####

from datetime import datetime, timedelta

def main() -> None:
    now = datetime.now()
    past = now - timedelta(days=1)
    future = now + timedelta(days=1)
    now_now = past + timedelta(days=1)

    print(f"now: {now}")
    print(f"past: {past}")
    print(f"future: {future}")
    print("")

    print(f"now > past: {now > past}")
    print(f"now == past: {now == past}")
    print(f"now < past: {now < past}")
    print("")

    print(f"now > future: {now > future}")
    print(f"now == future: {now == future}")
    print(f"now < future: {now < future}")
    print("")

    print(f"now > now_now: {now > now_now}")
    print(f"now == now_now: {now == now_now}")
    print(f"now < now_now: {now < now_now}")
    print("")


if __name__ == "__main__":
    main()
