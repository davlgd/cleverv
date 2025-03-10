module commands

import cli { Command }
import clever { Client }

pub fn summary_command() Command {
    return Command{
        name: 'summary'
        description: 'Show account summary'
        execute: handle_summary
    }
}

fn handle_summary(cmd cli.Command) ! {
    client := clever.new_client() or {
        eprintln('Error creating client: ${err}')
        return
    }

    summary := client.get_summary() or {
        eprintln('Error getting summary: ${err}')
        return
    }

    println(summary)
}
