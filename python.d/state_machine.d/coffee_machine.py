from transitions import Machine, State

####
# Task diagram
#
# * Cleanup the machine
# * Add Filter
# * Add Coffee
# * Add Water
# * Power On
#
# Important notes:
#   "Cleanup" needs to be done first.
#   "Add Filter" and "Add Coffee" depends on each other
#   but can be executed in parallel with "Add Water".
#   "Power On" can only be done if all states before are finished.
#
# ref: https://github.com/pytransitions/transitions
####

def foo_bar():
    print("FOO")

class CoffeeMachine:
    def __init__(self):
        self._coffee_was_added: bool = False
        self._filter_was_added: bool = False
        self._water_was_added: bool = False
        self._was_cleaned: bool = False
        self._was_powered_on: bool = False

        self.machine = Machine(
            model=self,
            states=[
                "idling", "cleaning", "adding_filter", "adding_coffee", "adding_water", "powering_on"
            ],
            transitions=[
                {"trigger": "clean", "source": "idling", "dest": "cleaning", "after": "after_cleaning"},
                {"trigger": "add_filter", "source": "cleaning", "dest": "adding_filter", "before": "before_add_filter"},
                {"trigger": "add_coffee", "source": "adding_filter", "dest": "adding_coffee"},
                {"trigger": "add_water", "source": "adding_coffee", "dest": "adding_water"},
                {"trigger": "power_on", "source": "adding_coffee", "dest": "powering_on"},
                {"trigger": "power_on", "source": "adding_water", "dest": "powering_on"},
            ],
            initial="idling"
        )

    def after_cleaning(self):
        self._was_cleaned = True

    def before_add_filter(self):
        if not self._was_cleaned:
            print("Adding filter it baby")
        self._filter_was_added = True


def main() -> None:
    coffee_machine = CoffeeMachine()

    print(f"{coffee_machine.state=}, {coffee_machine.is_idling()=}, {coffee_machine._was_cleaned=}")
    coffee_machine.clean();
    print(f"{coffee_machine.state=}, {coffee_machine.is_idling()=}, {coffee_machine._was_cleaned=}")
    coffee_machine.add_filter();
    #coffee_machine.power_on();
    print(f"{coffee_machine.state=}, {coffee_machine.is_idling()=}, {coffee_machine.may_clean()=}")


if __name__ == '__main__':
    main()
