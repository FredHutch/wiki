--  
title: Logging in Python
main_author: Zach Romer (zyd14)
primary_reviewers:
--
## Logging in Python

Related reading: 
- [Python Logging Cookbook](https://docs.python.org/3/howto/logging-cookbook.html)
- [Python Logging Docs](https://docs.python.org/3.8/library/logging.html)


### What
Logging in Python is performed through the simple and elegant `logging` module which comes in the standard
Python libraries. The `logging` module enables developers to produce structured log messages and direct those 
log messages to a variety of places of output including console, files, TCP/UDP socket, syslog, and SMTP emails. 
### Why
But I can just `print` stuff I need to see... why would I bother using a logger?  
Well, if you are writing applications which
you expect others to use, might run for long periods of time, or are dependent on external services which could cause errors
in your application if they are not working properly, chances are you may not be able to watch all your `print` statements
fly across the terminal for hours on end.  Or perhaps another user encounters an error while using your service, and replicating 
the error is simply impossible because you don't know what all the inputs were, whether an external service was down, or possibly
even what the error was. In these cases you'll want to have logs detailing the use of the application leading up to the crash, hopefully
capturing what went wrong and giving you insight into how to fix the problem without necessarily having to replicate it. Python loggers 
can be set up to automatically add contextual information such as line number the log message occurred on, timestamps, function / module,
stack traces, and more, all of which can become vitally important when doing post mortems on a failure.  

In more advanced use cases one can use retrospective log analysis on structured logs to profile an application and see things 
like how often components of your application are used, identify bottlenecks, and track down areas of the code where bugs
seem to occur more often.  When running in AWS Lambda, ECS, or Batch, the `logging` module automatically routes messages 
to CloudWatch, which can be essential for troubleshooting your code when executing in the cloud. 

### How  
Now we're getting to the meat (or tempeh if you prefer) and potatoes.  

Setting up a basic logger is very simple.
```python
import logging

logger = logging.getLogger('new_logger')
logger.setLevel(logging.DEBUG)

stream_handler = logging.StreamHandler()
logger.addHandler(stream_handler)

logger.info('Hello world!')
```
If you run the code above you should see `Hello world!` has been output to the terminal, much like a `print` statement would. 
Knowing this toy example doesn't really provide any obvious additional functionality to `print`, let's explore what's 
happening here.  
In the first section a `Logger` instance is created. Next, a `StreamHandler` is created, which by default will send log 
messages to `sys.stderr`.  Finally, `Hello world!` is outputted to the console by invoking the `info` method on the `Logger`
instance.   

We can quickly make this basic logger much more interesting by using a `Formatter`, which will add contextual information
to every log message which the `Handler` it is associated with emits.

```python
import logging

logger = logging.getLogger('new_logger')
logger.setLevel(logging.DEBUG)

formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s - line %(lineno)s')
stream_handler = logging.StreamHandler()
stream_handler.setFormatter(formatter)

logger.addHandler(stream_handler)
logger.info('Hello world!')
```  

Running this code, you should see something like this:  
`2020-01-23 14:46:29,928 - new_logger - INFO - Hello world! - line 11`  

Now let's examine the different components of a `Logger` to better understand what's going on.

#### Anatomy of a Logger

- **Loggers**  
A `Logger` instance is created when `logging.getLogger()` is called. Without any arguments this method returns a reference 
to a global root logger instance, which is stored in the `logging` module. By providing a string representing a name to 
`getLogger()` a child logger of the root logger is created. Loggers have a concept of log propagation up a chain of related 
parent-child loggers, which can be useful in more complex situations but will not be covered here.  For more information on 
hereditary log propagation please see the [Python Logging Cookbook](https://docs.python.org/3/howto/logging-cookbook.html) 
and / or the [Python Logging Docs](https://docs.python.org/3.8/library/logging.html).    

##### Handlers

##### Formatters

##### Filters

- **Log levels**  
Both `Logger` and `Handler` instances have an attribute called `.level`, which determines the severity of messages the 
`Logger` will emit.  Each log level is represented by a decimal number internally, although they can be referenced in a 
variety of ways.  The following table shows the various built-in log levels (although one can create their own log levels
as well).  
| Level | Int Representation | Str Representation |  
| --- | --- | --- |  
| DEBUG | 10 | 'DEBUG' |  
| INFO | 20 | 'INFO' |  
| WARNING | 30 | 'WARNING' |    
| ERROR | 40 | 'ERROR' |  
| CRITICAL | 50 | 'CRITICAL' |  


### Where