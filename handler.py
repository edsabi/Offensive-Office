import time
cmd1 = ''
while cmd1 != 'exit1':

     	
	
    cmd1 = input('#:')

    with open('shell.txt', 'w') as ifile:

        ifile.write(cmd1)


    time.sleep(4)

    with open('shell2.txt', 'r') as read_file:
        print(read_file.read().replace('\n\n','\n'))

    with open('shell.txt', 'w') as ifile:

        ifile.write('')

	
    with open('shell2.txt', 'w') as ifile:

        ifile.write('')



