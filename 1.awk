# 01.awk: print everything that doesn't match with the regular expression contained in variable 'var'.
# When calling this script, store the regular expression using the awk parameter -v.

$0 !~ var
