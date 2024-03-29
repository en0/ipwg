# Ian's Password Generator

ipwg is a password generator that can produce
passwords of any length and with required types
of characters.

A commandline tool is also available for all your
commandline task needs.

## Quick Start

```bash
pip install ipwg
```

For commandline use, you are all set. just run:

```bash
# 10 is the number of characters.
ipwg 10

# See all the options
ipwg -h
```

For use in your own code:

```python
from ipwg import Generator

# You can customize your charsets globally
Generator.specials = '!@#$'

generator = Generator(enable_all=True)
generator.specials_count = 1

# generate a 10 character long password with
# at least 1 of !@#$
pwd = generator.create_password(10)
```

## To publish

After changes are complete and unit tests are added,
run the following commands to verify the new package.
Note: You will need `twine` and `wheel` installed.

```bash
# Test publish to pypi test site
make tests && make publish-test

# Create a new python env and install from test
python -m venv test_venv &&
    source ./test_venv/bin/activate &&
    pip install -i https://test.pypi.org/simple/ ipwg

# You should now be able to test your changes
ipwg -h

# Cleanup the test environment
deactivate
rm -rf ./test_venv
```

If everything looks good above, publish to pypi

```bash
make publish
```