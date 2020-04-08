---
title: Python
primary_reviewers: k8hertweck, kmayerb, zyd14
---

For beginners to python, there are a variety of options.  See our page on [Training and Finding Help](/scicomputing/reference_training/) for additional details on in-person and other training opportunities. In addition to that, there are some publicly accessible resources available to assist in getting started learning and using Python for scientific research computing.    
  * [Getting started with Python](https://www.python.org/about/gettingstarted/)
  * [Python scientific computing with Scipy](https://www.scipy.org/getting-started.html)
  * [Python Data Analysis Library](http://pandas.pydata.org/pandas-docs/stable/10min.html)
  * [Learn Python the Hard Way](http://learnpythonthehardway.org/book/)
  * [Biopython tutorial](http://biopython.org/DIST/docs/tutorial/Tutorial.html)

## Accessing Python
There are many ways to use python beyond a local installation on your computer from [Python.org](https://www.python.org/downloads/).  These methods depend more on the type of computing you will need to use and in what way you want to interact with your code and it's output.  

### Via the local HPC cluster
SciComp maintains a current list of the various builds of Python available on `rhino` and `gizmo` for use by researchers.  Each build has different modules installed and versions of Python itself, thus identifying if an existing Python build matches your needs is a first step to using Python on `gizmo`.  Specific information about which Python Modules are available, including more information about packages installed in them can be found on our dedicated [Python Module page](/pythonModules/).  If you do not see the software you are looking for, email `scicomp` to request it or add your own GitHub issue in the [easybuild-life-sciences repo](https://github.com/FredHutch/easybuild-life-sciences).  Either way, please be specific about the source and version of the software you are interested in.  


### Via Jupyter Notebooks

Jupyter Notebooks are web interfaces to an interpreter shell such as Python. They are most used by data scientists who would like to experiment with their code and easily generate charts and graphs. At Fred Hutch there are at least 4 ways how you can use Jupyter Notebooks, including the latest incarnation called 'Jupyter Lab'.  You can find more information about Jupyter and related technologies [here at the Project Jupyter site.](http://jupyter.org/)

#### Jupyter Notebook on your computer

Install the software on your own computer [install Jupyter](http://jupyter.org/install) and run locally.

#### Jupyter on `Rhino`
Just load a Python distribution maintained by SciComp and run Jupyter lab:

```
    petersen@rhino1:~$ ml Python/3.6.7-foss-2016b-fh2
    petersen@rhino1:~$ jupyter lab --ip=$(hostname) --port=$(fhfreeport) --no-browser

    ... or simply use the 'jupyterlab' wrapper script:
    petersen@rhino1:~$ jupyterlab
```


Then connect to the URL, copying the link given by the previous command, which looks as follows:
```
       Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://rhino1:11112/?token=0eee692be6c81c1061db
```
#### Jupyter on `Gizmo`

From Rhino execute the `grabjupyter` command and a node will be allocated on Gizmo after you selected the CPUs and number of days you need the node.


#### Jupyter on Jupyterhub

SciComp maintains an installation of [Jupyterhub](https://jupyterhub.fhcrc.org/). Login with your Hutch Net Id.  (Jupyterhub does not have the latest Python packages)

Also only the first method allows you to install your own python packages as administrator of your machine.
The other 3 methods require you to either request a package from Scientific Computing or install the package in your home directory with the --user option (e.g. `pip3 install --upgrade --user mypkg`) or to create a virtual Python environment, for example:

```
    petersen@rhino1:~$ ml Python/3.6.7-foss-2016b-fh2
    petersen@rhino1:~$ python3 -m venv ~/mypython
    petersen@rhino1:~$ source ~/mypython/bin/activate
    (mypython) petersen@rhino1:~$ jupyter lab
    (mypython) petersen@rhino1:~$ deactivate
    petersen@rhino1:~$
```


## Writing Python Code:  Common IDE's

### Visual Studio Code 
This original content can still be found in it's [original repo](https://github.com/kmayerb/visual_studio_code_demo) written by a member of the Fred Hutch, this is an adaptation of that content. 

Some fantastic scientific programmers wait a long-time before trying a modern IDE. Here are some reasons to take a look at Visual Studio Code.
#### Setup
1. Install [Visual Studio Code](https://code.visualstudio.com/)
2. Add the following four key extensions (`Code Runner 0.9.16`, `Python`, `R`, `markdownlint`).
    * Do this by clicking on the four box icon on the left sidebar.
    * Search for the extensions by name and install
3. Ensure you have a python >= 3.6 environment available.

#### Shortcuts for Mac

* ⌘ is the Command () key.
* ⌃ is the Control key.
* ⌥ is the Option (alt) key.
* ⇧ is the Shift key.
* ⇪ is the Caps Lock key.
* Select Panes with ⌘1,⌘2, ... #n.  If n is greater than the number of open panes, this will create a new pane.
* Select Tabs within Panes with ⌃1,⌃2, ... ⌃n.  Get to the 2nd tab in the leftmost pane [⌘1], then [⌃2].
* Select Explorer Pane with ⌘0.  Once you are in the explorer you can use up and down keys to select files.

- Reveal File Paths Instantly
Click on the file panel Use the keyboard shortcut [⌥⌘C], and bam!, the full path is copied to your clipboard (e.g., `/Users/kmayerbl/active/demo_vsc/README.md`)

- Reveal Paths with Clicks
Instantly get to where your code lives on your machine. Save time by right-clicking on a folder or file, and select [Reveal in Finder] or [Open in Terminal]. Need the path just click [Copy Path].

- Save one or Save all by Group

Take a look at the icon on the browser panel. You can, with one-click, save all the files or all the files in a group.

- Preview your README.md

VSC offers a live rendering of your markdown. To view it, right-click on your markdown file and select [Open Preview].

#### Run Script or Only Part of Script With ⌃⌥N

You can run a segment of a script by selecting the part you care about and hitting [⌃⌥N]. The results show up in the OUTPUT table.

#### Identify Problems and Quick Their Quick Fixes

Linters help you find problems quickly. These are reported in the Problems tab of the  Here are two examples. 

* No-trailing-spaces (see one line above)
* No-bare URLs (see in the first block)

Get to the problems quickly with this shortcut [⇧⌘ M].

![Problems and Their Fixes](https://user-images.githubusercontent.com/46639063/75186808-8c5f6c80-56fd-11ea-91c3-1d09b401b734.png)

Here you can see tests that are failing, and "lint" that's piling up in your code. One of the things, I like about VSCode is that
you can auto-correct simple problems like those above without even having to search through the code.

#### Script Debugging

When we run python hi.py we see an error. Suppose we want to see where that error emerges.

```bash
Traceback (most recent call last):
  File "greetings/hi.py", line 51, in <module>
    assert sentance_case_to_be_degbugged("Camel") == "Camel"
AssertionError
```

* Breakpoints fn + F9, or using the mouse by clicking in the left margin in the editor.
* Click the Bug with the play icon
* We can start at the source of the error and move inwards

The breakpoint is placed on line 51 at the source of the error:

![error1](https://user-images.githubusercontent.com/46639063/75187868-d9444280-56ff-11ea-9893-e2a2fa064875.png)

"Step Into" the error (that is, go to the function being called) by clicking on the downward blue arrow.
Then, step line by line through the problematic function and check whether state of all variables meet your expectations.

![error2 1](https://user-images.githubusercontent.com/46639063/75188401-edd50a80-5700-11ea-9836-9d400300510d.png)

* More: <https://code.visualstudio.com/docs/python/debugging>

#### Develop a Specific Unit Test

A great thing about VSCode is how it organizes your test. You can even run them one by one.

![tests](https://user-images.githubusercontent.com/46639063/75184229-ea3d8580-56f8-11ea-83d3-1ee87fec849c.png)

Also here is an easter egg if you like doctests:

```bash
pytest --doctest-modules -v
```

#### Magic Sauce and Git Interface
The `Peak` function is Some Serious Magic beans.  Sometimes you don't want to search for where a variable or function is defined. VSCode has a peak function that let's examine externally referenced objects, and even edit them, directly from where an object is referenced. Let's look at what the French hello should be:

![peak](https://user-images.githubusercontent.com/46639063/75184186-d98d0f80-56f8-11ea-8e67-cd76626992f0.png)

##### Merge Conflicts example

Let's look at resolving a merge conflict. A merge conflict often arises when two users commit changes to the same file. For instance, on GitHub, I wrote:

```bash
I think we should think global!
```

But on my laptop, I wrote:

```bash
I think we should start local!
```

When I tried to, push the second commit, my push was rejected:

![Fail to Push](https://user-images.githubusercontent.com/46639063/75186423-b5333200-56fc-11ea-93e8-1aae785bc57c.png)

So I pulled the version on GitHub that was one commit ahead, revealing a conflict without an auto-resolution. Git cannot merge two versions of the same file, if they have different content on the same line! How would git know which was correct?

![Merge Conlict](https://user-images.githubusercontent.com/46639063/75185762-810b4180-56fb-11ea-810d-2560939496be.png)

Fortunately, VSCode makes it easy to review the confict and pick the winner (or keep both, by appending a version as new lines of code).

![Resolve Merge Conflict](https://user-images.githubusercontent.com/46639063/75185767-82d50500-56fb-11ea-8da1-4d32fddabe7c.png)

After resolving the conflict, remember to commit and push the resolution.

##### settings.json

JSON file with all your user-specific settings. How to get to it? (see the common settings wheel at the lower left)

![where is settngs dot json](https://user-images.githubusercontent.com/46639063/75194760-9ab58480-570d-11ea-95ed-d44fd5805197.png)
≈


### PyCharm
This original content can still be found in it's [original repo](https://github.com/zyd14/pycharm_demo) written by a member of the Fred Hutch, this is an adaptation of that content. 

Pycharm is an incredibly powerful IDE created by [JetBrains](https://www.jetbrains.com/pycharm/download/#section=mac).  It comes in a free, open-source community edition, and a paid-for subscription edition. 


#### Key shortcuts: 
- **⌘k** will bring up a commit dialog box, listing all the files that have been modified.  You can 
uncheck the checkbox next to each file that you don't want included in the commit.  A diff viewer will be present for
each file changed, allowing you to see how the file changed for this commit.

- **fn+⇧+k** will bring up the push menu, and will include a list of all the commits which will be pushed as a result of
this action, as well as the ability to view the diffs that will be applied to each changed file.

- **⌘b** will take you to the closest (scope-wise) definition of a variable you have high-lighted, whether that's
in the current function or deep in some third-party library in your virtual environment.  I find this one
to be invaluable when trying to trace back clues as to why an object isn't behaving the way I think it should,
and overall better understand how those objects work.

- **⌥⇧E** will allow you to execute any highlighted code in an IPython console which will automatically appear.
The console will contain the state of any state from previous code executions in that console, but can be easily 
reset using the 'return' button along the Python Console toolbar. This is super handy for testing small snippets of 
code while you're developing.

- **⇧⌘I**  will open up a small peek window with a view of the definition of an object or class you have highlighted. This
is in contrast to **⌘b**, which will take you directly to the module and location of the declaration of the highlighted object. 

![peek_image](https://github.com/zyd14/pycharm_demo/blob/master/peek.png)

All these hotkeys and tons more can be configured iin the **Preferences > Keymap** menu.

#### Object inspection, completion
When working with objects that may have lots of methods on them, it can be easy to forget what methods are available.
By simply typing a variable which has been prior been assigned a type (through just assigning it a value, Py3 method signature type hints,
or in-line type hints) and typing the '.' operator, a list of all properties and methods of that variable will appear in a dropdown.
Furthermore, onces you've selected a method and are beginning to feed it parameters, you can type **⌘p** from within the method parentheses to list all the parameters the function takes.  If you'd like to know more about how the function itself
works, you can jump to its definition by highlighting it and typing **⌘b**


#### Testing
Pycharm's testing abilities really help make this project shine.  From within the Prefences menu you have can select
Tools \> Python Integrated Tools.  From here you can choose your favorite test runner (mine happens to be pytest), which
will tell PyCharm what tool to use when detecting and running tests in your project.  

![Test Suite](https://github.com/zyd14/pycharm_demo/blob/master/test_ex.png)

By going to the **Test Configurations** menu under the **Run** menu dropdown you can make custom test
run configurations for particular modules or scripts, with different test runners or runtime parameters.

#### Debugging
While debugging doesn't always have to occur during a unittest, they often go hand in hand.  Say you've got a test that
is failing and you just don't know why.  Don't you which you could freeze the test right in the middle, inspect the variables
and see which one contains the erroneous value that is making the test puke?

To drop a breakpoint into a test, simply click on the gutter to the left of the line you want to stop at.  This will place
a red dot where the code will stop when we attach a debugger.  Now when you go to click the 'play' button on the test,
right-click and select 'Debug test_stuff.py'.  This will attach a debugger to the test runner, which will stop the code
every time it sees one of the red dots in the gutter.  When the test stops you'll have a few windows pop up in the bottom
of the IDE, one containing the current stack frames, and on containing any locally-defined variables and their value.  
You can also add variables to a watch list from this window, so that if the test traverses many functions you can
keep track of the value of an interesting variable.  Collections and objects in the **Variables** window will
give you the ability to drill-down through their attributes as well if you would like to further interrogate them.

![File ran with debugger](https://github.com/zyd14/pycharm_demo/blob/master/debugger.png)

#### Refactoring
Remember when you though 'xfddssd' would be a funny name for a variable? And then that racoon persisted throughout the project,
leaving its trail everywhere and leaving you and your teammates to try to figure out what a racoon object is in the context
of bioinformatics?  Pycharm makes refactoring of variable / object names extremely easy.  Simply highlight the variable 
or object you want to rename, click >**Refactor**, then click \> **Rename**.  Pycharm will then search for any reference
to that variable and present you with a list of all the places throughout the entire project that the highlighted variable occurs.  If you'd like to rename 
all of them it's as easy as clicking 'Do Refactor'.  I've found this incredibly useful for changing object names to be more
clear about their purpose, without having to hunt through scores of modules to determine where they occur. 

#### Find Usages
Sometimes you find a seemingly important variable or method that might need to be changed, but have no idea where it's being used or how it's being used.  By highlighting the object, right-clicking and clicking **Find Usages...** a small pop-up window will show where that varible is referenced throughout the entire project. This is particularly helpful for when you're cleaning up cruft and want to know if you can delete something.  'No Usages Found'? Deleted.

Right-clicking an object opens a menu which contains the 'Find Usages...' button:  
![find usages example](https://github.com/zyd14/pycharm_demo/blob/master/find_usages.png)

After clicking the 'Find Usages' button, a pane will open listing all the usages of that object found throughout the
project, presented in a tree-like fashion.  Double-clicking on any of these usages will take you directly to that location
in the code. 
![found_usages_example](https://github.com/zyd14/pycharm_demo/blob/master/found_usages.png)

#### Customized lint-hinting
PyCharm comes with a huge number of different of type and style hints to conform to PEP-8 and avoid some logic errors, particularly if you use the Python 3 type declarations in your code. Missing parentheses, brackets, bad indentation, unused
variable detection, unreachable code, possibly uninitialized variables being used all can be reported with varying levels of severity. Which hints to receive, as well as their presentation attributes, can be set in the **Preferences** menu under the **Editor** tab.

#### VCS integrations
While many of you are command-line git ninjas, I find myself pulling my hair out paging 
through merge conflicts or diffing various commits from a history.  The VCS integration in Pycharm makes it
easy to see what branches you're working on, whether any of those branches contain changes others don't,
and contains a beautiful diff viewer comparing files, whether it be do resolve a merge conflict, or while 
comparing a file to how it may have looked 6 months ago.

Files which have been modified since the last commit will be highlighted in blue, making it obvious what 
files you've touched.

Diff window comparing two conflicting files and showing the file resulting from how you merge the conflict.  
![Merge Conflict differ](https://github.com/zyd14/pycharm_demo/blob/master/merge_veiwer.png)

You also have the ability to look through the git revision history of any module or folder by selecting the folder / module,
right-clicking and selecing 'Git > Show history...'

![Show History](https://github.com/zyd14/pycharm_demo/blob/master/show_history.png)

This allows you to see the various concurrent branches of development for the file, as well as a diff viewer showing the 
commit diff at each commit.  This can be super handy when trying to find where a problem was introduced, or if you need to 
roll back to a specific commit before your last merge.

#### Jupyter Notebook

Pycharm is capable of running Jupyter Notebooks.  This is far from my area of expertise, but the community edition 
of Pycharm does appear to support it.  A very basic jupyter notebook file is included in this project repo to show that it
can be done.  The kernel running the Jupyter Notebook can be configured similarly to how a test runner is configured.
Go to the **Run** window dropdown, click > **Edit Configurations..** and select an item from the drop down below **Jupter Notebooks**
on the left side of the window that appears.

#### README writing
When writing any markdown file (ending with .md), PyCharm automatically picks it up as a markdown file and gives you the
option to view the rendered markdown side-by-side with your markdown file as you create it.

#### Extensions
There are lots of various plugins for PyCharm that can be accessed through the **Preferences** tab, for various things like
vim keyboard mappings, SQL highlighting and completion, bash completion, ticketing-service integrations, etc.

I've played with the youtrack extension before, and it was pretty neat once I got it up and running.  It allowed me to create
branches directly from an issue pulled from youtrack, and then commits I made to that branch would show
up in the youtrack ticket.  I could also close the ticket after merging the feature back in.  They have a number of other 
issue tracker integrations, including JIRA, Trello, and GitLab.

There are also various tools to enable easier development in cloud applications.  

#### Other languages
Pycharm attempts to provide basic code highlighting and completion (like closing tags in HTML) in various languages,
including HTML, SQL, and Docker.  The professional version provides better syntax highlighting for things like Django and 
Jinja2 templates (and I think some light-weight javascript highlighting?), but
I didn't really find them worth it when I did my 30-day free trial of the professional version.  There are many
active community projects for supporting tons of various languages.
