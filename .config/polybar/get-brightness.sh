#!/bin/bash

# Author: Chen L.F. <clfbbn@gmail.com>

get_brightness_test() {
  info=$(brightnessctl i)

  percent_text=$(echo $info | cut -d ' ' -f 9 | tr -d '()')
  echo $percent_text
}

get_brightness_test
