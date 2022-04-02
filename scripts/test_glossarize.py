#!/usr/bin/env python3

"""
Run me at the top level wiki directory like this:
pytest scripts/
You may need to set up the virtual environment first.
To do that:
cd scripts
pipenv install
pipenv shell
cd ..

"""

import pytest

import glossarize as gl

def test_replace_terms():
    # straightforward test
    assert gl.replace_terms("I like to use ssh.", ['ssh']) == \
      "I like to use {% glossary ssh %}."
    # make sure we don't re-glossarize
    assert gl.replace_terms("I like to use {% glossary ssh %}.", ['ssh']) == \
        "I like to use {% glossary ssh %}."
    # only glossarize the first occurrence
    assert gl.replace_terms("I like ssh and ssh likes me.", ['ssh']) == \
        "I like {% glossary ssh %} and ssh likes me."
    # make sure we don't glossarize in code blocks
    assert gl.replace_terms("I like to use `ssh`.", ['ssh']) == \
        "I like to use `ssh`."
    # make sure we don't glossarize in code blocks, but glossarize the first
    # occurrence that is not in a code block.
    assert gl.replace_terms("I like to use `ssh` and ssh likes me.", ['ssh']) == \
        "I like to use `ssh` and {% glossary ssh %} likes me."
    # also handle fenced code blocks. First just make sure we ignore them:
    assert gl.replace_terms("I like to use ```bash and ssh and other tools```.", ['ssh']) == \
        "I like to use ```bash and ssh and other tools```."
    # now glossarize the first occurrence that is not in a code block:
    assert gl.replace_terms("I like to use ```bash and ssh and other tools``` and ssh likes me.", ['ssh']) == \
        "I like to use ```bash and ssh and other tools``` and {% glossary ssh %} likes me."
    # make sure it's a distinct word
    assert gl.replace_terms("I also like autossh.", ['ssh']) == \
        "I also like autossh."
    # after skipping non-distinct words, still glossarize the next occurrence
    assert gl.replace_terms("I also like autossh and ssh likes me.", ['ssh']) == \
        "I also like autossh and {% glossary ssh %} likes me."
    # TODO figure out if we do case-insensitive searches (and replace with the same case??)
    # TODO make sure we don't search for terms in HTML tags? i.e. <div class="ssh">
