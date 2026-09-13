# Bash examples

## Enable automatic stop of the script on error

```bash
#!/bin/bash
####
# -e: (erexit) Stop script if executed command returns non-zero exitcode except in an if-condition
# -o pipefail: Non-zero exit code of a command is used as the exit code of this script
# ref: https://stackoverflow.com/a/90441
# -u: (nounset) Stop script if a variable is used but was never set
set -euo pipefail
```

## Make changes to the bash environment without affecting the bash environment

```bash
# Easy answer, just wrap all in a sub shell
# ref: https://unix.stackexchange.com/a/721798
function my_function ()
{
    # not affected bash environment
    (
        set -e
        
        # code that will stop when a command fails
    )
    # not affected bash environment
}
```

## Rename list of files

```bash
for f in $(ls my_file_*); do mv "${f}" "${f/old_filename_part/new_filename_part}"; done
```

