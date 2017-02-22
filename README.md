zcoinclassic integration/staging tree
================================

https://zcoinclassic.com

 Copyright (c) 2009 - 2016 Bitcoin Developers
 Copyright (c) 2015 - 2017 zcoin Developers
 Copyright (c) 2015 - 2017 zcoinclassic Developers

What is zcoinclassic?
----------------

zcoinclassic is the implementation of the Zerocoin protocol ( http://zerocoin.org ) guaranteeing true financial anonymity.

 - 10 minute block targets
 - 21 million total coins
 - 50 coins per block
 - Retarget using BRNDF every 6 blocks

For more information, as well as an immediately useable, binary version of
the zcoinclassic client sofware, see http://www.zcoinclassic.com

License
-------

zcoinclassic is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

Development process
-------------------

Developers work in their own trees, then submit pull requests when they think
their feature or bug fix is ready.

If it is a simple/trivial/non-controversial change, then one of the zcoinclassic
development team members simply pulls it.


The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/zcoinclassicofficial/zcoinclassic/tags) are created
regularly to indicate new official, stable release versions of zcoinclassic.

Testing
-------

### Automated Testing

Developers are strongly encouraged to write unit tests for new code, and to
submit new unit tests for old code.

Unit tests for the core code are in `src/test/`. To compile and run them:

    cd src; make -f makefile.unix test

Unit tests for the GUI code are in `src/qt/test/`. To compile and run them:

    qmake BITCOIN_QT_TEST=1 -o Makefile.test zcoinclassic.pro
    make -f Makefile.test
    ./zcoinclassic-qt_test

Installation
-------

Please see details in Wiki section

