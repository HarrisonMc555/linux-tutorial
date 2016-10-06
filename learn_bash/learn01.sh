#!/bin/bash

# LEARN 1
# Topic: Introduction to shell scripting
# New commands: echo, touch, chmod, ./, ls

# Welcome to shell scripting!

# As you can see, comments begin with # and go for one line

# A shell script is basically a script that will perform 
# command line operations for you.

# For example

echo "I am learning to write shell scripts."

# If you run this code, it will echo this string to the 
# command line.

# However, before you run the code, you need to change the 
# permissions of the file.

# To do so, first create a .sh file.
# The "touch" command simply creates a file if it doesn't 
# already exist but doesn't do anything to it.

touch shell.sh

# You can run shell scripts using several commands, the most 
# commmon being "bash"

bash shell.sh

# Other commands depend on which shell you want to use (bourne, 
# tcsh, etc.)

# Another option is to make the file executable and running it 
# by itself.

# The following command makes the program executable.

chmod +x shell.sh

# Note that for this to work,  the first line needs to be 
# #!/bin/bash
# See all of the learn files for examples.

# You don't do this next part, but you can:
#echo "#!/bin/bash
#echo \"I created a program in a program!\"
#" >> shell.sh

# The chmod commands changes the permissions of the file, and 
# the -x flag allows you to run it as an executable.

# You can then run the code using the following syntax:

./shell.sh

# The ./ simply tells the command line to execute a file from 
# ".", or current directory.

# You may have realized that because the previous statements weren't 
# commented, they will actually be run. That's true!

# If we use the ls command (which lists the file in the current directory), 
# we will now see that "shell.sh" is now there!

ls

# Try running this file by using "bash learn01.sh" or 
# "chmod +x learn01.sh" and "./learn01.sh"

# By the way, the "shell.sh" file won't do anything since it's an empty file,
# but it won't harm your computer to run it.