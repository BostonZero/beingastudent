import sys
import xml.etree.ElementTree as ET



class DFA:
    Q            = []                           ## list of states as ID and name
    sigma        = []                        ## list of alphabet
    delta        = [                            ## transition function list of sets in format start id, input code, end id
                    
                    ]                             
    q0           = "null"                            ## start state as ID
    F            = []                          ## accept states
    #currentState = q0                           ## this starts on q0 and will be changed as the dfa is calculated

    def pullXML(self,filename):
        #tree = ET.parse("test.xml")
        tree = ET.parse(filename)
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
            return 0        
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


myDFA = DFA()
inputData = sys.stdin.readline()

myDFA.pullXML(inputData)
inputData = "null"
#inputString                                     ## this will be loaded with the input string
# if inputData[-1] == "\n":
#     inputData = inputData[:-1]                       ##pesky newline handler


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



for a in myDFA.sigma:
    for b in myDFA.sigma:
        for c in myDFA.sigma:
            for d in myDFA.sigma:
                for e in myDFA.sigma:
                    eset = [a,b,c,d,e]
                    if myDFA.run(eset) == 1:
                            for letter in eset:
                                print(letter, end='')
                            print()
                dset = [a,b,c,d]
                if myDFA.run(dset) == 1:
                            for letter in dset:
                                print(letter, end='')
                            print()
            cset = [a,b,c]
            if myDFA.run(cset) == 1:
                            for letter in cset:
                                print(letter, end='')
                            print()  
        bset = [a,b]
        if myDFA.run(bset) == 1:
                            for letter in bset:
                                print(letter, end='')
                            print()       
    aset = [a]
    if myDFA.run(aset) == 1:
        for letter in aset:
            print(letter, end='')
        print()