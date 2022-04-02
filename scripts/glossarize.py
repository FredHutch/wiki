#!/usr/bin/env python3

"""
You should run this script from the top level wiki dir like this:
./scripts/glossarize.py
You may need to set up the virtual environment first.
To do that:
cd scripts
pipenv install
pipenv shell
cd ..


"""
import os
import yaml

def get_terms():
    "Assume the script is being run from the root dir of the wiki."
    with open('_data/glossary.yml', 'r') as flh:
        terms = yaml.safe_load(flh)
    
    return sorted([x['term'] for x in terms], key=str.casefold)

def replace_terms(text, terms):
    """
    Replace all terms in a string with the glossarized version,
    if the term is not already glossarized, or is in a code fragment.
    TODO - should we do case-insensitive search?
    Returns the modified string.
    """
    for term in terms:
        text = text.replace(term, "{{% glossary {} %}}".format(term))
    return text


def main():
    """
    Do the work.
    """
    terms = get_terms()
    # Again, assuming this script is being run from top-level wiki dir
    for root, dirs, files in os.walk('.'):
        for filename in files:
            if filename.endswith('.md'):
                pass
                # with open(os.path.join(root, filename), 'r') as flh:
                #     text = flh.read()
                # for term in terms:
                #     text = text.replace(term, f'[{term}]({term})')
                # with open(os.path.join(root, filename), 'w') as flh:
                #     flh.write(text)


if __name__ == "__main__":
    main()
