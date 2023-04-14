---
title: Running Tensorflow (and Keras) on GPUs
last_modified_at: 2019-05-25
main_author: Dirk Petersen
primary_reviewers: fizwit, vortexing
---

Running tensorflow with GPUs has become easier as of 2019 as the latest Gizmo J and K class nodes are equipped with GPUs.

## GPU Tensorflow in a Python Environment

### GPU Tensorflow with the standard Python

load a current version of Python 3.6 on Rhino using the ml shortcut for module load and then use pip3 to install Tensorflow in your user home directory. 

```
    ~$ ml Python/3.6.7-foss-2016b-fh2
    ~$ pip3 install --user --upgrade tensorflow-gpu
``` 

then create a small python test script:

```
    echo "#! /usr/bin/env python3" > ~/tf-test.py
    echo "import tensorflow" >> ~/tf-test.py
    echo "from tensorflow.python.client import device_lib" >> ~/tf-test.py
    echo "print(tensorflow.__version__)" >> ~/tf-test.py
    echo "print(tensorflow.__path__)" >> ~/tf-test.py
    echo "print(device_lib.list_local_devices())" >> ~/tf-test.py
    chmod +x ~/tf-test.py
```

and run it on Gizmo with `--gres=gpu` to select a node with GPU:


``` 
    ~$ sbatch -o out.txt --gres=gpu ~/tf-test.py
    ~$ tail -f out.txt
```

if you want to switch back to the non-GPU version of Tensorflow just uninstall the GPU version you installed under .local 

```
    ~$ pip3 uninstall tensorflow-gpu
    Uninstalling tensorflow-gpu-1.13.1:
    Would remove:
        /home/petersen/.local/bin/freeze_graph
        /home/petersen/.local/bin/saved_model_cli
        /home/petersen/.local/bin/tensorboard
        /home/petersen/.local/bin/tf_upgrade_v2
        /home/petersen/.local/bin/tflite_convert
        /home/petersen/.local/bin/toco
        /home/petersen/.local/bin/toco_from_protos
        /home/petersen/.local/lib/python3.6/site-packages/tensorflow/*
        /home/petersen/.local/lib/python3.6/site-packages/tensorflow_gpu-1.13.1.dist-info/*
    Proceed (y/n)?
```

### GPU Tensorflow in a virtual environment

Python virtual environments are useful for advanced users who would like to work with multiple versions of python packages. It is important to understand that the virtual env is tied to the Python environment you have previously loaded using the `ml` command. Let's load a recent Python and create a virtual environment called `mypy`

```
    ~$ ml Python/3.6.7-foss-2016b-fh2
    ~$ python3 -m venv mypy
    ~$ source ./mypy/bin/activate
    (mypy) petersen@rhino3:~$ which pip3
    /home/petersen/mypy/bin/pip3
```

Now that you have our own environment you can install packages with pip3. Leave out the --user option in this case because you want to install the package under the virtual environment and not under ~/.local 

```
    (mypy) petersen@rhino3:~$ pip3 install --upgrade tensorflow-gpu
``` 

Now you can just continue with the example from `GPU Tensorflow with the standard Python`. After you are done with your virtual environment you can just run the `deactivate` script. No need to uninstall the tensorflow package:

```
    (mypy) petersen@rhino3:~$ deactivate 
    ~$ 
```


### GPU Tensorflow from an Apptainer container  

To run in a Apptainer container, you need to start with a Docker image containing a modern Python and the _tensorflow-gpu_ package installed.  The [Tensorflow Docker images](https://hub.docker.com/r/tensorflow/tensorflow/) are all set up and ready.

After that load Apptainer:

    ml Apptainer

After that, the only change is to enable NVIDIA support by adding the `--nv`
flag to `apptainer exec`:

    apptainer exec --nv docker://tensorflow/tensorflow:latest-gpu-py3 python3

Sample code is available in the [slurm-examples repository](https://github.com/FredHutch/slurm-examples/tree/master/tensorflow-gpu).

## Tensorflow from R

Scientific Computing maintains custom builds of R and Python.
Python modules with fh suffixes have Tensorflow since version 3.6.1.
Only Python3 releases have the Tensorflow package. To use Tensorflow from
R, use the FredHutch Modules for R and Python.
Example Setup

```
    ml R
    ml Python/3.6.7-foss-2016b-fh2

    # Start R
    R
    # R commands
    pyroot = Sys.getenv("EBROOTPYTHON")
    pypath <- paste(pyroot, sep = "/", "bin/python")
    Sys.setenv(TENSORFLOW_PYTHON=pypath)
    library(tensorflow)
    tf_version()
    sess = tf$Session()
    hello <- tf$constant('Hello, TensorFlow!')
    sess$run(hello)
    # Sample output: b'Hello, TensorFlow!'
```

## Troubleshooting 

First verify that you have a GPU active (e.g. Tesla V100) as well as CUDA V 10.0 or newer

```
gizmok12[~]: nvidia-smi
Thu Sep 17 14:54:48 2020
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 440.100      Driver Version: 440.100      CUDA Version: 10.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce RTX 208...  Off  | 00000000:5E:00.0 Off |                  N/A |
| 38%   42C    P0    39W / 250W |      0MiB / 11019MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+
gizmok12[~]:
```

If you see any issues here you need to contact `SciComp` to have the error corrected 

Also please email `SciComp` to request further assistance 
