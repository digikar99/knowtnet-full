#!/bin/bash

OUTPUT_DIR=~/ram-disk/knowtnet

mkdir $OUTPUT_DIR
    /usr/bin/sbcl --dynamic-space-size 1024 \
         --noinform \
         --load $HOME/quicklisp/setup.lisp \
         --eval '(ql:quickload :swank)' \
         --eval '(ql:quickload :clsql)' \
         --eval '(setq clsql-sys:*foreign-library-search-paths* ())' \
         --eval '(push #P"./" clsql-sys:*foreign-library-search-paths*)' \
         --eval '(ql:quickload :knowtnet)' \
         --eval '(swank-loader:init :load-contribs t)' \
         --eval '(py4cl2:pystop)' \
         --eval "(sb-ext:save-lisp-and-die \"$OUTPUT_DIR/kt\" :toplevel #'knowledge-transfer::executable-entry-point :executable t :compression t)"

cp "/home/shubhamkar/quicklisp/dists/quicklisp/software/clsql-20160208-git/db-mysql/clsql_mysql64.so" $OUTPUT_DIR

cp -r www $OUTPUT_DIR

