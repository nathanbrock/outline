# Outline

> A helper script to create empty files for testing and debugging.

I don't know about you, but empty files are dam handy. This small script wraps around the 'dd' command to create an empty file, full of zeros, for the purpose of testing and debugging.

Side note. Files are generated using base-10 ([SI standard](https://wiki.ubuntu.com/UnitsPolicy)) units and not base-2. 1K = 1000, not 1024. If you have any thoughts on this please raise an issue.

## Usage

There are currently three units supported;

- K (ilobyte)
- M (egabyte)
- G (igabyte)

Using one of these units after a numeric value (integer or decimal) will output a file the size of the given value. For example

```
› outline 10M
 1+0 records in
 1+0 records out
 10000000 bytes transferred in 0.009635 secs (1037885777 bytes/sec)
 Created outline file '10M_file.txt'
```

Omiting the value defaults to byte value.

```
› outline 1234
 1+0 records in
 1+0 records out
 1234 bytes transferred in 0.000038 secs (32552020 bytes/sec)
 Created outline file '1234K_file.txt'
```

## Help

Run ```outline -h``` for some in-terminal help.

```
› ./outline -h

    USAGE:
       [-h|--help] NUMERIC_VALUE[K/M/G]

    EXAMPLES:
      outline 2M
      outline 10G block.txt
      echo 20M | outline
```

And that's it. Nothing really to it.