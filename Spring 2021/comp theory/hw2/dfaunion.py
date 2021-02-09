import sys
import xml.etree.ElementTree as ET
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning) 
import itertools


class DFA(object):
        
    def __init__(self):
        self.Q            = []                           ## list of states as ID and name
        self.sigma        = []                        ## list of alphabet
        self.delta        = [                            ## transition function list of sets in format start id, input code, end id
                        
                        ]                             
        self.q0           = "null"                            ## start state as ID
        self.F            = []                          ## accept states
        #currentState = q0                           ## this starts on q0 and will be changed as the dfa is calculated

    def pullXML(self, filename):
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
    def genXML(self):
        root = ET.Element("structure")
        automaton = ET.Element("automaton")
        root.append(automaton)
        for thing in self.Q:
            state = ET.Element("state")
            state.set("id", str(thing[0]))
            state.set("name", thing[1])
            automaton.append(state)
            if thing[0] == self.q0:
                initialTagger = ET.Element("initial")
                state.append(initialTagger)
            if thing[0] in self.F:
                finalTagger = ET.Element("final")
                state.append(finalTagger)
        for transSet in self.delta:
            transition = ET.Element("transition")
            fromTag = ET.Element("from")
            toTag = ET.Element("to")
            readTag = ET.Element("read")
            fromTag.text = str(transSet[0])
            toTag.text = str(transSet[2])
            readTag.text = str(transSet[1])
            transition.append(fromTag)
            transition.append(toTag)
            transition.append(readTag)
            automaton.append(transition)

        tree = ET.ElementTree(root) 
        with open ("genned.xml", "wb") as files : 
            tree.write(files)
        xmlstr = ET.tostring(element=automaton, encoding='unicode', method='xml')
        print(xmlstr)

debugMode = 1
dfa1 = DFA()
dfa2 = DFA()
dfa3 = DFA()
if debugMode == 1:
    inputData = ['test1.xml','test2.xml']
elif debugMode == 0:
    inputData = sys.stdin.readline().split()

dfa1.pullXML(inputData[0])
dfa2.pullXML(inputData[1])

for state1 in dfa1.Q:                                      ##build Q states
    for state2 in dfa2.Q:
        stateStr = str(state1[0]) + "-" + str(state2[0])
        dfa3.Q.append(stateStr)
dfa3.q0 = str(dfa1.q0) + "-" + str(dfa2.q0)                 ##build q0 state
dfa3.sigma = dfa1.sigma                                     ##alphabet should be the same


##do something like iterating through input, calculating the transition and saving it


print('done')
