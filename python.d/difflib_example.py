# ref: https://docs.python.org/3/library/difflib.html
from difflib import SequenceMatcher, get_close_matches


def _demonstrate_get_close_matches() -> None:
    list_of_strings: list[str] = ["foo", "bar", "baz", "faz", "bazzline"]
    best_match = get_close_matches("az", list_of_strings)

    print(f"{list_of_strings}")
    print("")
    print(f"Best match when searching for >>az<< are: {best_match=}")


def _demonstrate_sequence_matcher_blocks() -> None:
    first_string: str = "foo"
    second_string: str = "faz"

    sequence_match = SequenceMatcher(None, first_string, second_string)

    print(f"{first_string=}")
    print(f"{second_string=}")
    print("")
    print(f"{sequence_match.get_matching_blocks()}=")


def _demonstrate_sequence_matcher_opcodes() -> None:
    first_string: str = "foobar"
    second_string: str = "fazbar"

    sequence_match = SequenceMatcher(None, first_string, second_string)

    print(f"{first_string=}")
    print(f"{second_string=}")
    print("")
    print(f"{sequence_match.get_opcodes()}=")

    print("Demystify the return of get_opcodes")
    print("  tag tells what to do on this substring")
    print("  i1:i2 are there to fetch the substring from first string")
    print("  j1:j2 are there to fetch the substring from second string")
    print("----")
    for tag, i1, i2, j1, j2 in sequence_match.get_opcodes():
        print(f"{tag=}: {first_string[i1:i2]=} --> {second_string[j1:j2]=}")


def _demonstrate_sequence_matcher_ratio() -> None:
    first_sentence: str = "This is a nice sentence."
    second_sentence: str = "This a good sentence."
    third_sentence: str = "There is no foo without a bar."

    first_sequence_match = SequenceMatcher(None, first_sentence, second_sentence)
    second_sequence_match = SequenceMatcher(None, second_sentence, third_sentence)

    print(f"{first_sentence=}")
    print(f"{second_sentence=}")
    print(f"{third_sentence=}")
    print("")
    print(f"The similarity between the first_sentence and the second_sentence is: {first_sequence_match.ratio()=}")
    print(f"The similarity between the second_sentence and the third_sentence is: {second_sequence_match.ratio()=}")


def main() -> None:
    print(":: Demonstrating sequence matcher blocks")
    _demonstrate_sequence_matcher_blocks()
    print("")

    print(":: Demonstrating sequence matcher opcodes")
    _demonstrate_sequence_matcher_opcodes()
    print("")

    print(":: Demonstrating sequence matcher ration")
    _demonstrate_sequence_matcher_ratio()
    print("")

    print(":: Demonstrating get_close_matches")
    _demonstrate_get_close_matches()
    print("")

if __name__ == "__main__":
    main()
