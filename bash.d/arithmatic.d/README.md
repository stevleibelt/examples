# Arithmethic expressions in bash

## General Notes

Everything you but between `$((` and `))` is evaluated as numbers in bash.  
Beside `+`, `-`, `/`, `*`, `%`, `**`, [shell arithmetic](https://www.gnu.org/software/bash/manual/html_node/Shell-Arithmetic.html) supports your daily operators.  
Conversion between strings and numbers is done implicitly.

```bash
A=$((7 + 3))

# Don't use $ to address variables
# ref: https://www.shellcheck.net/wiki/SC2004
echo $((A * 23))
```

## Links

* [Date Arithmetic in Bash: miguelgrinberg.com](https://blog.miguelgrinberg.com/post/date-arithmetic-in-bash)

