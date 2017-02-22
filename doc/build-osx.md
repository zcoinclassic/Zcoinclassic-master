Mac OS X Daemon Build Instructions and Notes
====================================

* Modified by Aizen Sou (aizen0sou@gmail.com) @ 2017

Notes
-----

See `doc/readme-qt.rst` for instructions on building zcoinclassic-qt, the
graphical user interface.

Tested on OS X 10.7 through 10.12 on Intel processors only. PPC is not
supported because it is big-endian.

All of the commands should be executed in a Terminal application. The
built-in one is located in `/Applications/Utilities`.

Preparation
-----------

Install the OS X command line tools:

        xcode-select --install

When the popup appears, click Install.

You will also need to install [Homebrew](http://mxcl.github.io/homebrew/)

Dependencies
----------------------

        brew install automake berkeley-db4 libtool boost --c++11 miniupnpc openssl pkg-config --c++11 qt5

If you have trouble with linking openssl you can ensure that the Brew OpenSSL is correctly linked by running

        brew link openssl --force

Or manually by

        cd /usr/local/include 
        ln -s ../opt/openssl/include/openssl .
        
### Building `zcoinclassicd`

1. Clone the github tree to get the source code and go into the directory.

        git clone https://github.com/zcoinclassicofficial/zcoinclassic
        cd zcoinclassic

2.  Build zcoinclassicd:

        cd src
        make -f makefile.osx

3.  It is a good idea to build and run the unit tests, too:

        make -f makefile.osx test

Creating a release build
------------------------

A zcoinclassicd binary is not included in the zcoinclassic.app bundle. You can ignore
this section if you are building `zcoinclassicd` for your own use.

If you are building `zcoinclassicd` for others, your build machine should be set up
as follows for maximum compatibility:

All dependencies should be compiled with these flags:

    -mmacosx-version-min=10.5 -arch i386 -isysroot /Developer/SDKs/MacOSX10.5.sdk

For MacPorts, that means editing your macports.conf and setting
`macosx_deployment_target` and `build_arch`:

    macosx_deployment_target=10.5
    build_arch=i386

... and then uninstalling and re-installing, or simply rebuilding, all ports.

As of December 2012, the `boost` port does not obey `macosx_deployment_target`.
Download `http://gavinandresen-bitcoin.s3.amazonaws.com/boost_macports_fix.zip`
for a fix. Some ports also seem to obey either `build_arch` or
`macosx_deployment_target`, but not both at the same time. For example, building
on an OS X 10.6 64-bit machine fails. Official release builds of zcoinclassic are
compiled on an OS X 10.6 32-bit machine to workaround that problem.

Once dependencies are compiled, creating `zcoinclassic.app` is easy:

    make -f Makefile.osx RELEASE=1

Running
-------

It's now available at `./zcoinclassicd`, provided that you are still in the `src`
directory. We have to first create the RPC configuration file, though.

Run `./zcoinclassicd` to get the filename where it should be put, or just try these
commands:

    echo -e "rpcuser=zcoinclassicrpc\nrpcpassword=$(xxd -l 16 -p /dev/urandom)" > "/Users/${USER}/Library/Application Support/zcoinclassic/zcoinclassic.conf"
    chmod 600 "/Users/${USER}/Library/Application Support/zcoinclassic/zcoinclassic.conf"

When next you run it, it will start downloading the blockchain, but it won't
output anything while it's doing this. This process may take several hours.

Other commands:

    ./zcoinclassicd --help  # for a list of command-line options.
    ./zcoinclassicd -daemon # to start the zcoinclassic daemon.
    ./zcoinclassicd help    # When the daemon is running, to get a list of RPC commands
