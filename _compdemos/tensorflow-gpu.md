---
title: Running Tensorflow (and Keras) on GPUs
last_modified_at: 2018-12-28
main_author: Dirk Petersen
primary_reviewers: fizwit, dirkpetersen
---

In order to run tensorflow on GPUs you need to use a special version of Tensorflow. GPUs are currently installed on the [Koshu cluster](/compdemos/cluster_koshuBeta/) (Google cloud). In early 2019 GPUs will also be available on the new GizmoJ class nodes. For now please follow the instructions for getting a GPU based machines on Koshu: 


## GPU Tensorflow in a Python Environment 

### GPU Tensorflow with the standard Python

load a current version of Python 3.6 on Rhino using the ml shortcut for module load and then use pip3 to install the Tensorflow wheel made for Koshu and Gizmo 

```
    ~$ ml Python/3.6.7-foss-2016b-fh2
    ~$ pip3 install --user --upgrade /app/src/tensorflow/14.04/python3.6/cuda10/tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl
``` 

then create a small python test script:

```
    echo "#! /usr/bin/env python3" > ~/tf-test.py
    echo "import tensorflow" >> ~/tf-test.py
    echo "print(tensorflow.__version__)" >> ~/tf-test.py
    echo "print(tensorflow.__path__)" >> ~/tf-test.py
    chmod +x ~/tf-test.py
```

and run it on Koshu (for example)

```
    ~$ sbatch -M koshu -p gpu --gres=gpu:V100-SXM2-16GB:1 -o out.txt ~/tf-test.py
    Submitted batch job 27074536 on cluster koshu
    ~$ tail -f out.txt
    1.12.0
    ['/home/petersen/.local/lib/python3.6/site-packages/tensorflow', '...']
```

if you want to switch back to the non-GPU version of Tensorflow just uninstall the GPU version you installed under .local 

```
    ~$ pip3 uninstall tensorflow
    Uninstalling tensorflow-1.12.0:
    Would remove:
        /home/petersen/.local/bin/freeze_graph
        /home/petersen/.local/bin/saved_model_cli
        /home/petersen/.local/bin/tensorboard
        /home/petersen/.local/bin/tflite_convert
        /home/petersen/.local/bin/toco
        /home/petersen/.local/bin/toco_from_protos
        /home/petersen/.local/lib/python3.6/site-packages/tensorflow-1.12.0.dist-info/*
        /home/petersen/.local/lib/python3.6/site-packages/tensorflow/*
    Proceed (y/n)? y
        Successfully uninstalled tensorflow-1.12.0
```


### GPU Tensorflow in a virtual environment 

### GPU Tensorflow from a singularity container  

### Tensorflow from R
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

First verify that you have a GPU (Tesla V100 or Geforce) active as well as CUDA V 10.0 or newer

```
    petersen@koshuk0:~$ nvidia-smi 
    Thu Dec 27 14:44:19 2018       
    +-----------------------------------------------------------------------------+
    | NVIDIA-SMI 410.79       Driver Version: 410.79       CUDA Version: 10.0     |
    |-------------------------------+----------------------+----------------------+
    | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
    | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
    |===============================+======================+======================|
    |   0  Tesla V100-SXM2...  Off  | 00000000:00:04.0 Off |                    0 |
    | N/A   39C    P0    34W / 300W |      0MiB / 16130MiB |      0%      Default |
    +-------------------------------+----------------------+----------------------+
```

If you see any issues here you need to contact `SciComp` to have the error corrected 

Also please email `SciComp` to request further assistance 





