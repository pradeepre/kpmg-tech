import getopt
import sys
import json

def myfunc(obj, k):
	'''
	A function that when you pass in the object and a key and you get back the value
	'''

	fKey = k[-1]
	state = True
	while state:
		for i in obj:
			if i == fKey:
				print(f'Value of the passed Key is {obj[i]}')
				state = False
			else:
				obj = obj[i]

all_args = sys.argv[1:]					# Take arguments only
ob = all_args[1].replace("\'", "\"")	# Assign the object value
object = json.loads(ob)					# Convert to JSON
key = all_args[3]						# Assign the key value

try:
	# Gather the arguments
	opts, arg = getopt.getopt(all_args, 'o:k:')
	# Should have exactly two options
	if len(opts) != 2:
		print('usage: obj-key.py -o <object> -k <key>')
	else:
		# Iterate over the options and values
		myfunc(object, key)

except getopt.GetoptError:
	print('usage: obj-key.py -o <object> -k <key>')
	sys.exit(2)