#!/bin/bash
: '
Iguana (c) by Marc Ammon, Moritz Fickenscher, Lukas Fridolin,
Michael Gunselmann, Katrin Raab, Christian Strate

Iguana is licensed under a
Creative Commons Attribution-ShareAlike 4.0 International License.

You should have received a copy of the license along with this
work. If not, see <http://creativecommons.org/licenses/by-sa/4.0/>.
'

num=$(git tag --sort=version:refname -l production-* | tail -n 1 | cut -d- -f2)
num=$(($num + 1))
git tag production-$num
