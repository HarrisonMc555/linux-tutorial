# Unix Tutorial

This is meant to be a tutorial to learn the Unix command line (Linux and Mac),
the basics of shell scripting (using the bash shell), beginning sed and awk, and
some other various skills.



## Getting Set Up

These tutorials are about the Unix command line. To use these tutorials, you'll
need to open a terminal or command line in a Unix environment.

### Linux and OS X

Everything in here should work as is on machines running Linux or OS X (Mac).
Simply make a folder and start the command line. On a Mac you can do a spotlight
search for "Terminal", and on Linux it's usually built in fairly well.

### Windows

If you are running Windows and don't have access to a Linux or Mac machine,
there are some ways to get access to a Unix command line. If you are a BYU
Engineering or Computer Science student (or are taking a class from either
department) you can ssh into ssh.et.byu.edu or schizo.cs.byu.edu respectively.
To do this, download PuTTY.exe from the internet,a free, lightweight ssh client
for Windows. Simply type the address above in the "Host Name" section, and when
prompted provide your department username and password. You will log into a
Linux environment in which you can try out all of the Unix commands, run shell
scripts, etc. The only downside is that to edit text, you'll either need to
learn a command-line based editor (i.e. emacs, vim or nano) or copy and paste
all of your text into the PuTTY terminal (which can be done by right clicking
the screen after copying text in your native editor).

A handy tool to use in connection with PuTTY is WinSCP. This proivdes a GUI to
help you move files between your local computer and another machine, e.g. your
account on the Engineering Department, CS Department. You can do this using a
similar process to setting up PuTTY.

An alternative would be to download either 1) A tool to connect to your
department's Linux account with a GUI session or 2) a virtual machine. Vmware is
a professional tool that can be downloaded for free through BYU.



## Text Editor

After you have access to a terminal, the next thing you'll need to do is find a
good text editor to read and write your files in. Although it's possible to use
any text editor, including your Operating System's native one (Notepad,
TextEdit, etc.), in practice you'll really want to use an editor that, at the
very least, highlights syntax for you.

Some good, free text editors are:

   - Emacs
   - Vi/Vim
   - Sublime Text
   - Notepad++
   - Atom
   - Gedit
   - Kate
   - Nano
   - etc.

There are many free options online, almost any will probably do. Emacs, Vim, and
Nano all have the advantage of having the ability to be used via the command
line, meaning you can use it across an ssh session.



## Getting Started

To get started, go through the commands and tutorials listed in the directory
"learn_unix". They will go through many of the basics of using a Unix-style
command line.

After you're familiar with navigating the command line on your own, you can go
through the files in the directory "learn_bash". They will go through the basics
of bash shell scripting. If they seem too basic for you, you can look at the
headers for each file to see if the topics or commands each one covers is
unfamiliar and only go through those tutorials.

After going through those, you can go through the files in the "learn_awk",
"learn_sed", or other tutorials (later to come) to learn other tools.

At any point, you can start to practice by experimenting with creating your own
scripts or by trying out the exercises, or "missions". In the "mission"
directory, you'll find files that describe a particular "mission" you must
perform. These are good opportunities to try to apply the skills you've learned
in the tutorials. They mostly target shell scripting, which is an extension of
what you can do with the command line on your own, but you can use sed, awk, or
whatever other tool you find at your disposal.