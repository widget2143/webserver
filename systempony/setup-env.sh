#! /bin/sh
#
# Copyright (C) 2016 Mattia Basaglia
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

SELFDIR=$(dirname $(readlink -f "$0"))
ENV_NAME=.env

if ! which pip3 pyvenv python &>/dev/null
then
    echo "The following tools are required to set up a virtual environment:"
    echo "    * python"
    echo "    * pip"
    echo "    * virtualenv"
    exit 1
fi

cd "$SELFDIR"
pyvenv "$ENV_NAME"
rm "$ENV_NAME/bin/python"
ln -s "python3" "$ENV_NAME/bin/python"
ln -s "$ENV_NAME/bin/activate" activate
source activate
pip3 install --user -r "$SELFDIR/requirements.pip"