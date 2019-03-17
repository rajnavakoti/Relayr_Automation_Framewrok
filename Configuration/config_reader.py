# This python file consists of any prerequisites configurations required to setup the automation tests.

from configparser import ConfigParser
import os

# This function is intended to read the key value from Config.ini file
# @arguments : list name; key
# @return : ley value
def read_value_from_config(_list_name, _key):
    config = ConfigParser()
    config.read(os.path.join(os.path.split(__file__)[0], 'config.ini'))
    _value = config.get(_list_name, _key)
    return _value