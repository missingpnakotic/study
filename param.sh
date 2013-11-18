#!/bin/sh

var1='start'
echo ${var1}

echo 'var1がnullの時:-を設定'
var1=
echo ${var1:-"bbb"}

echo 'var1がnot nullの時:+を設定'
var1="aaa"
echo ${var1:+"ccc"}

echo 'nullの時:=を設定'
var1=
echo ${var1:="ddd"}

echo 'var1がnullの時:?を表示'
var1=
${var1:?'empty'}

echo 'これは実行されない'
echo "end";
