#!/usr/bin/env python3

import subprocess
import os

def get_triggers(match_path):
    """
    get_triggers returns a list of all uncommented triggers found in all .yml files that are inside the Espanso match directory except those named completions.yml.
    """
    triggers = []
    for root, dirs, files in os.walk(match_path):
        for file in files:
            if file.endswith(".yml") and file != "completions.yml":
                file_path = os.path.join(root, file)
                with open(file_path, 'r') as f:
                    for line in f:
                        if line.strip().startswith("- trigger:") and not line.strip().startswith("#"):
                            trigger = get_trigger(line)
                            triggers.append(trigger)
    return triggers

def get_trigger(line):
     """
     get_trigger takes a line from a match file and returns the trigger. For input of this form:

        `  - trigger: "my-trigger" `
    
    it will return the string "trigger", without the quotes.
     """
     if line.strip().startswith("- trigger:") and not line.strip().startswith("#"):
        return line.strip().replace("- trigger: ", "").strip('"').strip("'")
     
def get_completions_for_trigger(trigger, completions=None, current_completion=""):
    """
    get_completions returns a list of completions for the given trigger. The
    completions comprise all proper, non-empty substrings of the trigger, with a
    tab character added to the end of each. For example, get_completions(":foo")
    would return [":\t", ":f\t", ":fo\t"]
    """
    if completions is None:
        completions = []

    if len(trigger) == 1:
        return completions
    
    current_completion = current_completion + trigger[0]
    completions.append(current_completion + "\t")
    return get_completions_for_trigger(trigger[1:], 
                                       completions, current_completion)
      
def get_triggers_string(trigger, completions):
    triggers = f"  - triggers: {completions}\n".replace("'", '"')
    replace = "    replace: " + "\"{{output}}\"\n"
    vars = f"    vars:\n      - name: output\n        type: match\n        params:\n          trigger: {trigger}"
    return triggers + replace + vars + "\n\n"

def main():
    match_path = ""

    try:
        result = subprocess.run(['espanso', 'path'], capture_output=True, text=True, check=True)
        output = result.stdout.strip()
        config_path = output.split('\n')[0].split(":")[1].lstrip()
        match_path = config_path + "/match"

    except subprocess.CalledProcessError as e:
        raise Exception(f"Failed to run 'espanso path': {e}")

    completions_file = os.path.join(match_path, "trigger-completions.yml")

    with open(completions_file, 'w') as f:
        f.write("# Completions generated automatically by espanso-complete.")
        f.write("\n\nmatches:\n\n")

    triggers = get_triggers(match_path)
    with open(completions_file, 'a') as f:
        for t in triggers: 
            completions = get_completions_for_trigger(t)
            new_triggers = get_triggers_string(t, completions)
            f.write(new_triggers)
   

if __name__ == "__main__":
  main()
