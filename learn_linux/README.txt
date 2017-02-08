=====================
README for learn_unix
=====================

This section is all about using a Unix-style command line, or terminal. If you
can, it would be helpful to open these files in a text editor in one window and
a command line in another window so you can try out the commands and tips as you
read about them.


How To Use
==========

Many of these files refer to "executing a command". This means to type in the
name of the command first, followed by zero or more "parameters", separated by
spaces". If you want to include spaces in a command, you can surround the entire
parameter by spaces, and the command will treat the quoted phrase as one
parameter.

After you type in your command, simply press Enter, and the command will
execute. If it looks like nothing happened (besides a new line), then there's a
good chance that the command was successful and didn't feel like it needed to
tell you anything. For example, if you type 'cd dir', the terminal would change
the working directory to 'dir', but wouldn't say anything. However, if you typed
'cd dirdoesnotexist' to a directory that doesn't exist, then it would return an
error like the following:

cd: dirdoesnotexist: No such file or directory

In general, Unix commands only produce output when the user asks for it (e.g.
the ls command), or when it really needs to. In general, silence is considered
golden.


Getting Started
===============

It is suggested that you start with basic_navigation, which will teach you how
to navigate in the Unix command line.

After that, a convenient place to look would be terminal_tips. This file will
teach you about tips that will make your life easier and teach you to use the
command line faster.

After that you should know many of the commands listed in Commands. However, you
don't need to know all of the commands listed to move on to other portions of
this tutorial.

There are other resources available, including several excellent, more in-depth
Online Tutorials and other resources.