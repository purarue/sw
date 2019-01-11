# sw - <b>S</b>top<b>W</b>atch
Terminal stopwatch

![sw](https://user-images.githubusercontent.com/3503322/27557638-8a488c40-5a77-11e7-804b-3aff10df6365.gif)

# Install

To install `sw` using [Sinister](https://github.com/jamesqo/sinister), run

    wget -q -O - http://git.io/sinister | sh -s -- -u https://raw.githubusercontent.com/seanbreckenridge/sw/master/sw

Or just [download sw directly](https://raw.githubusercontent.com/seanbreckenridge/sw/master/sw) and place it on your PATH somewhere.

# Usage

    sw
     - starts a stopwatch
     - press any alphanumeric key to stop

# Centiseconds

macOS comes bundled with BSD's `date` which does not print sub-second dates and thus `sw` will not print centiseconds. I recommend installing GNU `date` to enable this improved functionality:

    brew install coreutils
