module commands

import cli { Command }
import json
import clever { Client }

pub struct User {
pub:
    id string
    name string
    email string
}

pub fn profile_command() Command {
    mut cmd := Command{
        name: 'profile'
        description: 'Show user profile information'
        execute: handle_profile
    }

    cmd.add_flag(cli.Flag{
        flag: cli.FlagType.string
        name: 'format'
        abbrev: 'f'
        description: 'Output format (default or json)'
        default_value: ['default']
    })

    return cmd
}

fn handle_profile(cmd cli.Command) ! {
    client := clever.new_client() or {
        eprintln('Error creating client: ${err}')
        return
    }

    profile := client.get_self() or {
        eprintln('Error getting profile: ${err}')
        return
    }

    format := cmd.flags.get_string('format') or {
        'default'
    }

    if format == 'json' {
        println(profile)
    } else {
        user := json.decode(User, profile) or {
            eprintln('Error parsing profile: ${err}')
            return
        }
        println('${user.name} (${user.email})')
    }
}
