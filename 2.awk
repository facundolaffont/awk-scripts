# 2.awk.
# Prints the sum of files sizes in a folder.

BEGIN {
  size = 0;
  letterIndex = 0;
  adder = 0;
  bytesAdder = 0;
  kiloBytesAdder = 0;
  megaBytesAdder = 0;
  gigaBytesAdder = 0;
  teraBytesAdder = 0;
  petaBytesAdder = 0;
  kiloMultiplier = 1024;
  megaMultiplier = 1024 * 1024;
  gigaMultiplier = 1024 * 1024 * 1024;
  teraMultiplier = 1024 * 1024 * 1024 * 1024;
  petaMultiplier = 1024 * 1024 * 1024 * 1024 * 1024;
  finalLetter = "";
}
{
  if($1 != "total") {
    letterIndex = match($5, "[^0-9.]");
    if(letterIndex > 0) {
      size = substr($5, 1, letterIndex - 1);
      if(substr($5, letterIndex) == "B") {
        bytesAdder += size;
      } else if(substr($5, letterIndex) == "K") {
        kiloBytesAdder += size;
      } else if(substr($5, letterIndex) == "M") {
        megaBytesAdder += size;
      } else if(substr($5, letterIndex) == "G") {
        gigaBytesAdder += size;
      } else if(substr($5, letterIndex) == "T") {
        teraBytesAdder += size;
      } else if(substr($5, letterIndex) == "P") {
        petaBytesAdder += size;
      }
    } else {
      bytesAdder += $5;
    }
  }
}
END {
  adder += bytesAdder;
  adder += kiloBytesAdder * kiloMultiplier;
  adder += megaBytesAdder * megaMultiplier;
  adder += gigaBytesAdder * gigaMultiplier;
  adder += teraBytesAdder * teraMultiplier;
  adder += petaBytesAdder * petaMultiplier;

  if(adder > petaMultiplier) {
    adder = adder / petaMultiplier;
    finalLetter = "PiB";
  } else if (adder > teraMultiplier) {
    adder = adder / teraMultiplier;
    finalLetter = "TiB";
  } else if (adder > gigaMultiplier) {
    adder = adder / gigaMultiplier;
    finalLetter = "GiB";
  } else if (adder > megaMultiplier) {
    adder = adder / megaMultiplier;
    finalLetter = "MiB";
  } else if (adder > kiloMultiplier) {
    adder = adder / kiloMultiplier;
    finalLetter = "KiB";
  }

  print adder,finalLetter;
}
