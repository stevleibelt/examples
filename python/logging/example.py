#!/usr/bin/python3

import logging
import logging.config
import os

# bo: logging setup
logging.config.fileConfig(
    fname=os.path.join(
        os.path.dirname(__file__),
        'logging.conf'
    )
)
# **HINT**: you can advanced this by using os.getenv('MY_ENV_KEY', 'INFO')
logging.getLogger().setLevel(logging.INFO)
# eo: logging setup

# bo: application
logging.debug("Debug log message", extra={'context': 'my context'})
logging.info("Info log message", extra={'context': 'my context'})
logging.error("Error log message", extra={'context': 'my context'})
# eo: application

