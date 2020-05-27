import sys
import subprocess
from subprocess import Popen, PIPE
from sys import argv


try:
	script, file_name = argv
except ValueError:
	print(f'Usage: python {__file__} <steg_file>')
	sys.exit(0)
	
report_file = open('report_file.txt', 'w')

#Performs command as current user
def regEx(command):
	print(f'Executing {command}')
	p = Popen(command, stdin=PIPE, stdout=PIPE, stderr=PIPE, universal_newlines=True, shell=True)
	out, err = p.communicate()
	return out

def report(command):
	report_file.write('--------------------------------\n')
	report_file.write(f'{command}\n\n')
	try:
		report_file.write(regEx(f'{command}'))
	except Exception as e:
		print(f'{command} - {e}')
		pass
	report_file.write('--------------------------------\n\n')


report(f'file {file_name}')
report(f'exiftool {file_name}')
report(f'binwalk {file_name}')
regEx(f'binwalk -e {file_name}')
report(f'strings {file_name} | grep -i \'flag\|ctf\'')
regEx(f'foremost {file_name} -o output/foremost_output')
report(f'pngcheck {file_name}')
report(f'stegdetect {file_name}')
report(f'hideme {file_name} -f')
regEx(f'jpseek {file_name} output/jpseek.txt')
regEx(f'jsteg reveal {file_name} output/jsteg.txt')
regEx(f'openstego extract -sf {file_name} -xd output')
regEx(f'outguess-0.13 -r {file_name} output/outguess-0.13.txt')
regEx(f'outguess -r {file_name} output/outguess.txt')
report(f'stegano-red reveal -i {file_name}')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g ackermann -o output/stegano-lsb-set-ackermann.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g ackermann_naive -o output/stegano-lsb-set-ackermann_naive.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g carmichael -o output/stegano-lsb-set-carmichael.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g composite -o output/stegano-lsb-set-composite.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g eratosthenes -o output/stegano-lsb-set-eratosthenes.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g fermat -o output/stegano-lsb-set-fermat.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g fibonacci -o output/stegano-lsb-set-fibonacci.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g identity -o output/stegano-lsb-set-identity.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g log_gen -o output/stegano-lsb-set-log-gen.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g mersenne -o output/stegano-lsb-set-mersenne.txt')
regEx(f'stegano-lsb-set reveal -i {file_name} -e UTF-8 -g triangular_numbers -o output/stegano-lsb-set-triangular_numbers.txt')
regEx(f'LSBSteg decode -i {file_name} -o output/LSBSteg.txt')
regEx(f'stegpy {file_name}')
report(f'zsteg -a {file_name}')
report(f'stegoveritas {file_name} -o output/stegoveritas_output')

report_file.close()

print("\n\nQuick Analysis\n")
print(regEx('strings report_file.txt | grep -i \'flag\|ctf\''))
