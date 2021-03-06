from os import name
import sys
import xml.etree.ElementTree as ET
from xml.dom import minidom 

import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning) 

class DFA:
    Q            = [[0, "q0"], [1, "q1"], [2, "q2"], [3, "q3"], [4, "q4"]]                           ## list of states as ID and name
    sigma        = [0, 1]                        ## list of alphabet
    delta        = [                            ## transition function list of sets in format start id, input code, end id
                    [0,0,0],
                    [0,1,1],
                    [1,0,1],
                    [1,1,2],
                    [2,0,2],
                    [2,1,3],
                    [3,0,3],
                    [3,1,4],
                    [4,0,4],
                    [4,1,4]
                    
                    ]                             
    q0           = 0                            ## start state as ID
    F            = [3]                          ## accept states
    currentState = q0                           ## this starts on q0 and will be changed as the dfa is calculated

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


myDFA = DFA()

myDFA.genXML()