import sys



class DFA:
    Q            = ["q1","q2","q3"]                 ## list of states
    sigma        = ["0","1"]                        ## list of alphabet
    delta        = [                                ## transition function list of sets in format start, transition, end
                    ["q1", "0", "q1"],
                    ["q1", "1", "q2"],
                    ["q2", "0", "q3"],
                    ["q2", "1", "q2"],
                    ["q3", "0", "q2"],
                    ["q3", "1", "q2"]
                    ]                             
    q0           = "q1"                             ## start state
    F            = ["q2"]                           ## accept states
    currentState = q0                               ## this starts on q0 and will be changed as the dfa is calculated


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
            
    def run(self):
        if inputString == "":
            print("reject")
            return 0
        for transitionCode in inputString:
            for set in self.delta:
                if (set[0] == self.currentState and set[1] == transitionCode): ##find the correct list to reference
                    self.setCurrentState(set[2])                                ##reference the end state and call the function to set it
                    break                                                       ##no need to go through more when the correct list has been found

        if self.currentState in self.F:                                         ##verify if we can accept or reject this string (return codes in case i want them in the future)
            print ("accept")
            return 1
        print("reject")
        return 0


myDFA = DFA()

inputData = sys.stdin.readline()
#inputString                                     ## this will be loaded with the input string
inputCursor = 0                                  ## this is a cursor for the input string so i can keep track of whats been calculated

#if inputData[-1] == "\n":
#    inputData = inputData[:-1]                       ##pesky newline handler


if inputData == "states":
    myDFA.getQ()
elif inputData == "alpha":
    myDFA.getSigma()
elif inputData == "transitions":
    myDFA.getDelta()
elif inputData == "start":
    myDFA.getQ0()
elif inputData == "accepts":
    myDFA.getF()
else:
    inputString = inputData


myDFA.run()
