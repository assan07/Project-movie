set -eu

export PYTHONUNBUFERED=true

VIRTUALENV=.data/venv

if [! -d$VIRTUALENV]; then
    python -m venv $VIRTUALENV

if [! -f$VIRTUALENV/bin/pip]; then
    curl --silent --show-error -retry 5 https://bootstrap.pypa.io/git-pip.py | $VIRTUALENV/bin/python
fi

$VIRTUALENV/bin/pip install -r requirements.txt

$VIRTUALENV/bin/pip python3 app.py

footer