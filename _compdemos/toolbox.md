---
title: Using Toolbox to Get Hutch Master Data 
last_modified_at: 2019-01-10
main_author: Dirk Petersen
primary_reviewers: mrg, dirkpetersen
---

## What is [toolbox.fhcrc.org](https://toolbox.fhcrc.org/)?

Did you ever want to know to which PI or division a user rolls up to, check if someone is Hutch staff or affiliated or get all users in the same department? Then Toolbox may be for you. Toolbox is a system that provides Hutch [master data](https://en.wikipedia.org/wiki/Master_data) to developers (currently focusing on user centric master data).
Toolbox can only be accessed from inside the Hutch network or VPN and you may have already used it to get access to credentials for cloud computing or `Economy` storage access. If you develop applications or need any kind of automation that requires information about the almost 5,000 Hutch employees and non-employees (e.g affiliates) this is the tool for you. Toolbox is polling the central HR database daily so your scripts will always use current information.

## Data Format

Toolbox offers its data as simple [json](https://toolbox.fhcrc.org/json/) or [csv files](https://toolbox.fhcrc.org/csv/) and you can easily parse them using your favorite coding tool such as Python, R or the Linux shell. You can browse the json files using Chrome or Firefox. (The Microsoft browsers IE and Edge want to download json files instead).

## What Datasets are Available?

The exact file collection available is in flux but here is an extract:

* **faculty.json/csv** - a list of all member track Hutch faculty
* **pi.json/csv** - a combined list of all member track Hutch faculty and Hutch staff who have been contact PI on a NIH grant in the last 5 years. Members of this list are getting certain allocations of data storage and high performance computing covered by center funds. IDs for Faculty / PI ID's are built from the PI's last name and the first initial of the preferred first name (or nick name), e.g. doe_j for Jane Doe
* **users.json/csv** - all active hutch employees and non-employees (affiliates). If a person has a "preferred name" (aka nick name) set in the HR system, the givenName column will always be set to this entry.
* **employees.json/csv** - all Hutch employees (Faculty and Staff)
* **sc_users.json/csv** - all users in departments that have had at least one scientific computing user in the past. Users in this list automatically get a posix home directory (formerly known as 'Fred account') and other scientific computing accounts (such as access to the Gizmo, Beagle and Koshu compute clusters)
* **pi2user.json/csv** - get the user name (hutchnet id) of a PI when passing in the PI id (lastname_f aka doe_j)
* **user2pi.json/csv** - get the PI id by passing in the user id of a person in the reporting line of the PI
* **user2sup.json.csv** - get the immediate supervisor by passing in the user id
* **pi_groups.json/csv** - get users who are member of a security group that governs access to a PIs data in center storage systems (e.g. Fast & Economy File)
* **pi_groupmember.json/csv** - get the security groups a specific user is member of. The list of security groups is limited to the ones that govern access to Fast File and Economy local and cloud (S3) storage.


## Writing code that uses Toolbox

There are 2 types of JSON files. Files that have the number "2" in their names are simple mappings or key / value pairs. For example `user2sup.json` allows you to get the the username of the direct supervisor of a user. Other files are larger tables. For example `users.json` contains all users (faculty, staff and affiliates) with details such as department, job titles and division. These json databases are presented as lists of dictionaries in Python. The field or column naming convention are mostly based on [LDAP RFC 2798](https://tools.ietf.org/html/rfc2798), e.g. givenName, displayName, sn (for surname).

> Note: Human Biology has the ID 'CB' which is an artifact of the past and Shared Resources has its own division ID although it technically rolls up under Research Administration. 



### Python

To parse JSON files from a web server we need to import the `requests` and `json` packages. To process csv files we use the `pandas` package which is the standard toolset for python based data scientists.
Files with "2" in their name are converted to simple Python dictionaries, e.g. `{'key1': 'valueA', 'key2': 'valueB'}`. The other JSON files are converted to a list of dictionaries were each dictionary represents a row. `[{'key1':'A','key2':'B'},{'key1':'C','key2':'D'}]`. In the csv files this would be a row in the table.
To start with a simple example let's say we want to find the supervisor of Fred Appelbaum, the Center's deputy Director. We pull the file user2sup.json into a json object and then a Python dictionary. The correct answer should be Gary Gilliland's user id and voila:

``` python
    >>> import requests, json
    >>> URL = 'https://toolbox.fhcrc.org/json/user2sup.json'
    >>> d = requests.get(URL).json()
    >>> print(d['fappelba'])
    gary
```

Then we would like to know to which PI user markg (Mark Groudine) rolls up to:

``` python
    >>> URL = 'https://toolbox.fhcrc.org/json/user2pi.json'
    >>> d = requests.get(URL).json()
    >>> print(d['markg'])
    groudine_m
```

The answer is of course `groudine_m`. When we query other staff who reports indirectly or directly up to Mark Groudine the result would also be `groudine_m`. If we query the username of non-scientific staff there is no PI to roll up to and user2pi will return an empty string.

 
``` python
    >>> URL = 'https://toolbox.fhcrc.org/json/user2pi.json'
    >>> d = requests.get(URL).json()
    >>> print(d['petersen'])
```

Now let's look for a slightly more complicated query. We are looking for staff in the clinical research division who have the word 'Engineer' in their job title and in the search result we would like to display 2 columns: department and title.

``` python
    >>> URL = 'https://toolbox.fhcrc.org/json/users.json'
    >>> users = requests.get(URL).json()
    >>> for user in users:
    >>>     if user['division'] == 'CR' and 'Engineer' in user['title']:
    >>>         print(user['department'], user['title']) 
    Clinical Research Data Systems Application Suppt Engineer
    ...
    Clinical Research Data Systems Software Dev Engineer
```

If you prefer csv over json you can do the same thing using the `csv` package, you just need to write 2 lines more code.

``` python
    >>> import requests, csv
    >>> URL = 'https://toolbox.fhcrc.org/csv/users.csv'
    >>> r = requests.get(URL)
    >>> reader = csv.DictReader(r.iter_lines(decode_unicode=True))
    >>> for row in reader:
    >>>     if row['division'] == 'CR' and 'Engineer' in row['title']:
    >>>         print(row['department'], row['title']) 
    Clinical Research Data Systems Application Suppt Engineer
    ...
    Clinical Research Data Systems Software Dev Engineer
```

Most data scientists will use the power of pandas to query csv files. If you think that iterating over a list is not too elegant this may be the right option for you.

``` python
    >>> import pandas
    >>> URL = 'https://toolbox.fhcrc.org/csv/users.csv'
    >>> df = pandas.read_csv(URL)
    >>> crdeng = df.loc[(df['division'] == 'CR') & (df['title'].str.contains('Engineer')), ['department', 'title']]
    >>> print(crdeng)
                            department                       title
    237   Clinical Research Data Systems  Application Suppt Engineer
    ...
    1882  Clinical Research Data Systems       Software Dev Engineer
```

#### Filtering json files using the `sci` package

Querying json files can be a bit unwieldy for more complex queries. The `sci` python package offers a few wrapper and shortcut functions for scientists and programmers. The sci package is already installed on Rhino if you load the latest Python through the `ml` command. Otherwise you can just install the sci package in your home directory. The `sci` package only supports Python3 and the next examples require a sci package >= 0.1.0)

```
    pip3 install --user --upgrade sci
```

``` python
    import requests, json, sci
    URL = 'https://toolbox.fhcrc.org/json/users.json'
    users = requests.get(URL).json()

    # get a list of all employeeIDs
    uids = sci.json.jget(users, 'employeeID'))

    # get a list of employeeIDs of all Administrative Assistants
    uids = sci.json.jsearch(users,'title','Administrative Assistant','employeeID')

    # get the job title of the 10th user in the list 
    mytitle = sci.json.jsearchone(users,"employeeID",uids[9],"title")

    # Search and return an entire row of the first match
    user = sci.json.jgetonerow(users,'title','President & Director'):
```

In another example we would like to send an email notification to users who regularly write code at Fred Hutch to inform them of new features and we also want to CC their supervisors to increase awareness. Coders may have a range a job titles we need to consider but there is no chance this will be comprehensive list. The output list of email addresses is separated by semicolon so you can paste it directly into to, cc or bcc fields of Outlook. (Please note: This example requires sci package >= 0.1.3)

```python
    #! /usr/bin/env python3
    import sci
    titles = [
            'Software Dev Engineer',
            'Software Dev Eng',
            'Bioinformatics Analyst',
            'Programmer',
            'Developer'
            ]
    users = sci.fh.getToolbox('users.json')
    coders = []
    supervisors = []
    for u in users:
        for t in titles:
            if t in u['title']:
                if u['mail'] not in coders:
                    coders.append(u['mail'])
                    email = sci.json.jsearchone(users,'mgrID',u['mgrID'],'mail')
                    if email and email not in supervisors:
                        supervisors.append(email)

    print('\n### Coders ####')
    print('; '.join(coders))
    print('\n### Supervisors ####')
    print('; '.join(supervisors))
```

#### Velocity Checks

If you are adding and deleting users based on active users in Toolbox you will sooner or later run into the situation that something fails and Toolbox  returns a user list that is empty. Now your script may think that all users have left the center and will try to delete all existing users in the system you manage. To prevent this we are building a velocity check. A velocity check is a routine that checks if a certain action makes sense. For example it will be extremely unlikely that 100 users or more will leave the Hutch at any given day so we will just cancel all actions that involve more than 100 users.

```
   CODE EXAMPLE TBD
```

### R

R also offers a few nice options: use library `jsonlite` to process JSON files. For importing a csv file into a tibble (a dataframe like object with a few convenience features that was inspired by the pandas dataframe) use `readr` to import and then `dplyr` to filter it with a sql like syntax. 

First we would like to know to which PI user `markg` (Mark Groudine) rolls up to:

``` R
    > library(jsonlite)
    > URL = 'https://toolbox.fhcrc.org/json/user2pi.json'
    > user2pi = fromJSON(URL)
    > print(user2pi['markg'])
    $markg
    [1] "groudine_m"
```

No surprise: he rolls up to PI id `groudine_m`

Then we try processing a csv file and show the filtering capabilities of `dplyr`. We would like to find the first name of all employees who are among the first 50 employees of the Hutch since it was founded. Hutch employee IDs start with 10000.

``` R
    > library(readr, dplyr)
    > URL = 'https://toolbox.fhcrc.org/csv/employees.csv'
    > tib = read_csv(URL)
    > newtib = tib %>% select(employeeID, givenName) %>% filter(employeeID < 10050)
    > print(newtib)
    # A tibble: 4 x 2
    employeeID givenName
        <int> <chr>    
    1      10002 Brenda   
    2      10018 Stan     
    3      10035 Patricia 
    4      10041 Molly   
```

### Linux Shell (bash and jq)

Through the Linux Shell (e.g. on Rhino) you have access to many tools such as such as `curl` and `jq`, the command-line JSON processor, that can help processing information quickly.

Consider the unlikely scenario that you need to collaborate with every PI and would like to create a folder for each PI just as you see it in Fast File (/fh/fast):

``` bash
    URL=https://toolbox.fhcrc.org/json/pi.json
    rootdir=/fh/fast/doe_j/collab
    for PI in $(curl -s ${URL} | jq -r '.[] | .pi_dept'); do
        if ! [[ -d ${rootdir}/${PI} ]]; then
            mkdir -p ${rootdir}/${PI}
        fi
    done
```

Check to which PI user markg (Mark Groudine) rolls up to:

```
    curl -s https://toolbox.fhcrc.org/json/user2pi.json | jq -r .markg
```

If you would like to retrieve the email addresses of all center employees:

```
    curl -s https://toolbox.fhcrc.org/json/employees.json | jq -r '.[] | .mail'
```

How many unique job titles are there? 

```
    curl -s https://toolbox.fhcrc.org/json/employees.json | jq -r '.[] | .title' | sort | uniq | wc -l
```

## Information for System Administrators 

As of early 2019 Toolbox lives on VM fox.fhcrc.org. Most scripts are symlinks under /root/bin that point to a git clone of the FredHutch/IT repository.

```
    root@fox:~# readlink ~/bin/sc_dump_groups_json.py /root/github/IT/general/newusernotify/sc_dump_groups_json.py
```

Several cron jobs are triggered, groups are updated hourly:

```
    root@fox:~# cat /etc/cron.d/sc_dump_groups_json 
    10 * * * * root /root/bin/sc_dump_groups_json.py --users > /var/www/toolbox/json/pi_groupmember.json 
    11 * * * * root /root/bin/sc_dump_groups_json.py  > /var/www/toolbox/json/pi_groups.json
    12 * * * * root /root/bin/sc_dump_groups_json.py --gid
```

## Final Thoughts

If you have a proposal for improvements either in the text or in the code examples please send a pull request. If you have examples in other Programming languages that are used at Fred Hutch (Java, C#, Powershell) please also send a pull request. If you would like see other Fred Hutch master data via Toolbox or if you believe that any of the data is incorrect please email Dirk Petersen.  

