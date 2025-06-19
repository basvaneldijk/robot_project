# Houdt de status van de HMI bij en geeft door welke knoppen aan/uit moeten staan

class StateMachine(object):
    def __init__(self):
        self.state = "standby"

    def transition(self, command):
        if command == SINGLE_START:
            self.state = "single_active"
        elif command == CYCLUS_START:
            self.state = "cyclus_active"
        elif command in [STOP, NOODSTOP]:
            self.state = "vergrendeld"
        elif command == HOME:
            self.state = "home"
        elif command == RESET:
            self.state = "standby"

    def get_state(self):
        return self.state
