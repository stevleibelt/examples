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

    print(":: Dumping datetime values")
    print(f"{now=}")
    print(f"{past=}")
    print(f"{future=}")
    print("")

    print(":: Comparing present with the past")
    print(f"{now > past=}")
    print(f"{now == past=}")
    print(f"{now < past=}")
    print("")

    print(":: Comparing present with the future")
    print(f"{now > future=}")
    print(f"{now == future=}")
    print(f"{now < future=}")
    print("")

    print(":: Comparing present with the present")
    print(f"{now > now_now=}")
    print(f"{now == now_now=}")
    print(f"{now < now_now=}")
    print("")

    print(":: Comparing positive and negative timedeltas")
    print(f"{now - timedelta(days=1)=}")
    print(f"{now + timedelta(days=-1)=}")
    print("")


if __name__ == "__main__":
    main()
