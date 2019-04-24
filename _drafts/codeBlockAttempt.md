---
title: Attempting Code Blocks!!
last_modified_at: 2019-04-24
---
## Testing...
To see if we can get some code blocks in multiple languages to show up in the site.

{% tabs %}

  {% tab Command %}
    {% highlight bash %}
    #!/bin/bash

source /app/Lmod/lmod/lmod/init/bash
module use /app/easybuild/modules/all

ls --version
module load Coreutils/8.27-GCCcore-5.4.0
ls --version

    {% endhighlight %}
  {% endtab %}


  {% tab Python %}
    {% highlight python %}
    import os
import sys

sys.path.insert(0,"/app/Lmod/lmod/lmod/init")

from env_modules_python import module

os.system('ls --version')
module('load','Coreutils/8.27-GCCcore-5.4.0')
os.system('ls --version')
    {% endhighlight %}
  {% endtab %}

  {% tab R %}
    {% highlight r %}

source('/app/Lmod/lmod/lmod/init/R')

system('ls --version')

module('load', 'Coreutils/8.27-GCCcore-5.4.0')

system('ls --version')
    {% endhighlight %}
  {% endtab %}

  {% tab Web %}
    Instructions for Web + screenshots
  {% endtab %}

{% endtabs %}
