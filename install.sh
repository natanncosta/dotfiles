#!/bin/exp

spawn yay -S dotnet-sdk-6.0
expect ":: Proceed with installation? [Y/n]"
send "Y"
expect "==>"
send "n"
expect "==>"
send "n"

spawn yay -S dotnet-sdk-5.0
expect ":: Proceed with installation? [Y/n]"
send "Y"

