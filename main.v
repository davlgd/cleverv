module main

import os
import cli { Command }
import commands

fn main() {
    mut cmd := Command{
        name: 'CleverV'
        description: 'A CLI to interact with the Clever Cloud API with API Tokens'
        version: '0.1.0'
    }

    cmd.add_command(commands.profile_command())
    cmd.add_command(commands.summary_command())

    cmd.setup()
    cmd.parse(os.args)
}