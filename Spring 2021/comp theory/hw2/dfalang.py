import sys
import xml.etree.ElementTree as ET
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning) 


class DFA:
    Q            = []                           ## list of states as ID and name
    sigma        = []                        ## list of alphabet
    delta        = [                            ## transition function list of sets in format start id, input code, end id
                    
                    ]                             
    q0           = "null"                            ## start state as ID
    F            = []                          ## accept states
    #currentState = q0                           ## this starts on q0 and will be changed as the dfa is calculated

    def pullXML(self,filename):
        tree = ET.parse(filename)
        if tree.getroot().tag == "automaton":
            root = tree
        else:
            root = tree.find("automaton")

        for child in root.findall("state"):
            stateData = child.attrib
            tempSet = [str(stateData.__getitem__('id')), str(stateData.__getitem__('name'))]
            self.Q.append(list(tempSet))
            sfCheck = child.getchildren()
            for subchildren in sfCheck:
                if subchildren.tag == 'initial':
                    self.q0 = str(stateData.__getitem__('id'))
                if subchildren.tag == 'final':
                    self.F.append(str(stateData.__getitem__('id')))

        for child in root.findall("transition"):
            tData = child.getchildren()
            tempSet = [str(tData[0].text),str(tData[2].text),str(tData[1].text)]
            self.delta.append(tempSet)
            if tData[2].text not in self.sigma:
                self.sigma.append(tData[2].text)

    def setCurrentState(self, trans3):
        self.currentState = trans3

    def getQ(self):
        for state in self.Q:
            print(state)

    def getSigma(self):
        for transition in self.sigma:
            print(transition)
    
    def getDelta(self):
        for transitionSet in self.delta:
            print(transitionSet[0]+ " " + transitionSet[1] + " " + transitionSet[2])

    def getQ0(self):
        print(self.q0)

    def getF(self):
        for state in self.F:
            print(state)
            
    def run(self, inString):
        self.setCurrentState(self.q0)
        if inString == "":
            #print("reject")
            if self.currentState in self.F:
                return 1
            else: return 0        
        for transitionCode in inString:
            for set in self.delta:
                if (str(set[0]) == str(self.currentState) and set[1] == transitionCode):     ##find the correct list to reference
                    self.setCurrentState(str(set[2]))                                           ##reference the end state and call the function to set it
                    break                                                               ##no need to go through more when the correct list has been found

        if self.currentState in self.F:                                         ##verify if we can accept or reject this string (return codes in case i want them in the future)
            #print ("accept")
            return 1
        #print("reject")
        return 0

debugMode = 0
myDFA = DFA()
if debugMode == 1:
    inputData = 'test.xml'
elif debugMode == 0:
    inputData = sys.stdin.readline()
#inputData = sys.argv[1]
#inputData = "null"

#inputString                                     ## this will be loaded with the input string
#if inputData[-1] == "\n":
#    inputData = inputData[:-1]                       ##pesky newline handler
myDFA.pullXML(inputData)

# if inputData == "states":
#     myDFA.getQ()
# elif inputData == "alpha":
#     myDFA.getSigma()
# elif inputData == "transitions":
#     myDFA.getDelta()
# elif inputData == "start":
#     myDFA.getQ0()
# elif inputData == "accepts":
#     myDFA.getF()
# else:
#     inputString = inputData
# dictionary = [
# "",
# "00001",
# "00011",
# "00100",
# "00101",
# "00111",
# "01001",
# "01011",
# "01100",
# "01101",
# "01111",
# "10000",
# "10001",
# "10011",
# "10100",
# "10101",
# "10111",
# "11001",
# "11011",
# "11100",
# "11101",
# "11111",
# "0001",
# "0011",
# "0100",
# "0101",
# "0111",
# "1001",
# "1011",
# "1100",
# "1101",
# "1111",
# "001",
# "011",
# "100",
# "101",
# "111",
# "01",
# "11",
# "1"
# ]
# for test in dictionary:
#     print(test)
# ###

for a in myDFA.sigma:
    for b in myDFA.sigma:
        for c in myDFA.sigma:
            for d in myDFA.sigma:
                for e in myDFA.sigma:
                    eset = [a,b,c,d,e]
                    if myDFA.run(eset) == 1:
                            theStr = ""
                            for letter in eset:
                                theStr += letter
                            print(theStr,end='\n')
                dset = [a,b,c,d]
                if myDFA.run(dset) == 1:
                            theStr = ""
                            for letter in dset:
                                theStr += letter
                            print(theStr,end='\n')
  
            cset = [a,b,c]
            if myDFA.run(cset) == 1:
                            theStr = ""
                            for letter in cset:
                                theStr += letter
                            print(theStr,end='\n')
   
        bset = [a,b]
        if myDFA.run(bset) == 1:
                            theStr = ""
                            for letter in bset:
                                theStr += letter
                            print(theStr,end='\n')
      
    aset = [a]
    if myDFA.run(aset) == 1:
                            theStr = ""
                            for letter in aset:
                                theStr += letter
                            print(theStr,end='\n')

if myDFA.run("") == 1:
    print("")

#for i in range(0,len(dictionary)):
#        print(dictionary.pop())