# Maintenance status plugin for Sal.

Special thanks to Daniel Hazelbaker for putting together his TimeMachine plugin.

## Client Script

The client script is an external facter script, which means it needs to
be placed in the /etc/facter/facts.d directory for it to run properly. It
will provide a number of facts about the computer it is running on.

* maintenance_configured: 1 if the maintenance logging is configured, 0 if not.
* maintenance_count: number of times maintenance has been logged.
* maintenance_last: The date, as a unix timestamp, of the last time maintenance was logged.
* maintenance_first: The date, as a unix timestamp, of the first time maintenance was logged.

## Server Plugin

The server plugin provides list information to help you categorize the
following states of machines:

* Maintenance Logging Configured
* Maintenance Logging not configured
* Maintained < 7 days ago
* Maintained between 7 and 28 days ago
* Maintained > 28 days ago

## Requirements

The client script requires Facter to be installed on the clients. If you
don't already have it installed, get it installed. Provides a lot of nice
information.
