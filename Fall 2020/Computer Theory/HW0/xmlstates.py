import sys
import xml.etree.ElementTree as ET

filename = sys.stdin.readline()

firstcheck = 1

tree = ET.parse(filename)
root = tree.getroot()
for state in root.findall('state'):
    if(firstcheck == 0):
        sys.stdout.write(state.get('name'))
        firstcheck = 1
    else:
        sys.stdout.write(" " + state.get('name'))
print()
for state in root.findall('state'):
    itemlist = state.findall('initial')
    if len(itemlist) > 0:
        print (state.get('name'))

for state in root.findall('state'):
    itemlist = state.findall('final')
    if len(itemlist) > 0:
        print (state.get('name'))