# extract #
Tiny tool that extracts PNG image data embedded in OpenText .xsp markup files.

## What? ##
If there is a base64 encoded PNG image embedded in an .xsp markup file, this
tool will extract the data and save it to a .png file. Useful for me, probably
not useful for anyone else!

## How? ##
One of several ways to get the tool:
1) clone the repository (or download it), and run `nim c extract.nim` from the
root of the project. Recommended to also use the options `-d:release -d:danger`.
2) download a prebuilt binary and put it somewhere. There are no external dependencies.
3) if you have the `nimble` tool installed you can run `nimble install` from the
project root.

## License? ##
Do whatever you want with this...