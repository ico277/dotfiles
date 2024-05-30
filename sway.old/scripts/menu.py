#!/bin/env python3.11
from subprocess import Popen, PIPE, STDOUT, run
from os import getenv,listdir

# get scripts path
PATH = getenv("HOME", default=".") + "/.config/sway/scripts/"

def bemenu(options:[str], default=False):
    process = run(
        ["bemenu"], stdout=PIPE,
        input="\n".join(options), encoding='UTF-8'
    )
    output = process.stdout.split("\n")[0].strip()
    if output in options:
        return output
    else:
        return default
    
# get scripts
scripts = listdir(PATH)
# run bemenu to choose script
option = bemenu(scripts)
# generate subcommands
subcommands = [option]
if not option:
    exit(1)
elif "volume.sh" in option:
    subcommands.append(option + " -")
    subcommands.append(option + " +")
    subcommands.append(option + " +5")
    subcommands.append(option + " -5")

# run bemneu with subcommand
final_option = bemenu(subcommands)

# run command
run(["sh", "-c", f"{PATH}/{final_option}"])
