# 1.awk.
# Prints everything except what is matched against the regular expression stored in a variable called 'regex'.

$0 !~ regex
