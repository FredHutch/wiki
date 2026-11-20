---
title: Using Modules with VS Code 
original_author: John Dey 
primary_reviewers: jfdey, dtenenbaum
---

Configure VS-Code to 
use the remote environment on the HPC cluster with LMOD modules.
This speicific integration is for Python based LMOD packages. 
Use Python venv to create a remote activation script that can 
be used by VS-Code.

There are many different software tools based on Python Modules.
A unique project directory should be created for each software project.

### Steps to Implement 

 - Save the lmod_venv.sh script bellow to your Linux home directory
 - From Linux command line, loading your required modules
 - Create a project folder and cd to folder
```
mkdir -p ~/projects/scGPT
cd projects/scGPT
```

 - Create a python virtual envirmen
`python3 -m venv venv-name`
 - Active the `lmod_venv` functions. This can be done at anytime before accessing
the `create_lmod_venv` function and only should be done once per login session.
```
source ~/lmod_venv.sh
```
Modify the project based virtual environment to support use of loaded modules.
```
create_lmod_venv venv-name
```

This virtual environment can now be used from VS-Code.
  - Start VS-code
  - Open Remote SSH connect
  - From command Pallet use: Python: Create Environment
  - Select the venv/bin/activate script

 
### lmod_venv.sh Script

```
#!/bin/bash

function create_lmod_venv() {
    local venv_name=$1
    
    # Store current LMOD environment
    module list 2>&1 | awk '{if ( NF == 2){print $2}}' > "${venv_name}/module_list"
 
    # Store LD_LIBRARY_PATH
    echo $LD_LIBRARY_PATH > "${venv_name}/ld_library_path"
 
    # Save current PYTHONPATH
    echo "export _OLD_PYTHONPATH=\"\${PYTHONPATH:-}\"" >> "${venv_name}/bin/activate"
    
    # Create function to load LMOD modules
    cat >> "${venv_name}/bin/activate" << 'EOL'

# Load LMOD modules specific to this environment
if [ -f "$VIRTUAL_ENV/module_list" ]; then
    while IFS= read -r module; do
        module load "$module"
    done < "$VIRTUAL_ENV/module_list"
fi

# Set LD_LIBRARY_PATH
export LD_LIBRARY_PATH=`cat ${VIRTUAL_ENV}/ld_library_path`

# Modify deactivate to handle LMOD environment
deactivate_lmod() {
    # Reset PYTHONPATH
    if [ -n "${_OLD_PYTHONPATH:-}" ] ; then
        PYTHONPATH="${_OLD_PYTHONPATH:-}"
        export PYTHONPATH
        unset _OLD_PYTHONPATH
    fi
    
    # Unload all modules
    module purge
    
    # Remove LD_LIBRARY_PATH
    unset LD_LIBRARY_PATH

    # Call original deactivate
    deactivate
}

# Override deactivate command
alias deactivate=deactivate_lmod
EOL
}

# Usage
# After loading your required modules, run:
# python3 -m venv venv-name
# source ~/lmod_venv.sh
# create_lmod_venv venv-name
```
