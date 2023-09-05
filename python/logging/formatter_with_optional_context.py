#!/usr/bin/python3

import logging

class ContextualFormatter(logging.Formatter):
    def format(self, record: logging.LogRecord) -> str:
        if 'context' in record.args:
            return f'{super().format(record=record)} - ({record.args["context"]})'
        else:
            return super().format(record=record)

def get_logger(log_level: int) -> logging.Logger:
    logger = logging.getLogger(__name__)
    handler = logging.StreamHandler()
    # ref: https://docs.python.org/3/library/logging.html#logrecord-attributes
    formatter = ContextualFormatter('%(asctime)s %(funcName)s[%(levelname)s] L%(lineno)s: %(message)s')

    handler.setFormatter(fmt=formatter)

    logger.addHandler(handler)
    logger.setLevel(log_level)

    return logger


def main():
    logger = get_logger(logging.DEBUG)

    logger.debug('Message with no context')
    logger.debug('Message with context', {'context': {'foo': True, 'bar': [1, 2, 3]}})


if __name__ == '__main__':
    main()
