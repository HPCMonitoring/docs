# Virtual Sensor

Virtual sensor documentation.

## Collected data descriptions

### Common data

- `pid`: Process ID
- `parent_pid`: Parent process ID
- `uid`: User ID, assigned to each user account on a system.
  - Root user has UID 0
  - Non-root users have a UID of 1000 or higher
- `effective_uid`: used to determine the permissions and actions that a user can perform
  - When a process is executed, it inherits the effective UID of the user who started it
  - In some cases, a process may change its effective UID to gain additional privileges or to assume the identity of another user. This is often done by the `su` or `sudo` commands
- `saved_uid`: is a value stored by the system that represents the real UID of a process
  - The saved UID is used to restore the real UID after the process has finished executing with the elevated privileges base on effective UID
- `fs_uid`: File system user ID, used to associate file system permissions with a specific user or group of users
  - Be stored as part of the file system metadata
  - Typically the same as the UID of the user who created a file, but it can be changed through various file system commands, such as `chown`.
- `gid`: User group ID:
  - Used to track and manage the permissions and access controls for collections of users
  - Each user on a Linux system is typically a member of one or more groups, and each file or directory on the system is associated with a specific group
- `effective_gid`: Similar to effective UID, but for a group
- `saved_gid`: Similar to saved UID, but for a group
- `fs_gid`: Similar to file system UID, but for a group
- `executed_path`: process pwd
- `command`: command line used to run process
- `child_pid_list`: List of child PIDs
- `threads`: List of process's [threads](#thread-data)
- `stats`: [Process statistic](#statistic-data)

### Data in namespace

A process runs in container such as `Docker`, `LXC` ... or runs in a VM has its own namespace. Inside its namespace, it has extra same [information types](#common-data) like a process runs on host.

### Thread data

- `tid`: Thread ID
- `timestamp`
- `resource_consumptions`: [Resource consumed](#resource-consuming-statistic-data)

If a thread belongs to a process inside container or VM, it also has another TID in its namespace.

### Statistic data

- `timestamp`
- `resource_consumptions`: [Resource consumed](#resource-consuming-statistic-data)
- `rss`: Resident set size, a measure of memory usage in the Linux operating system.
  - Represents the portion of a process's virtual memory that is held in RAM and is available for immediate use
  - Can help user identify memory-intensive processes and determine whether the system has enough memory to run all its processes effectively
- `vss`: Virtual set size, another measure of memory usage in the Linux operating system
  - Represents the total amount of virtual memory that a process is using, including memory that may be swapped to disk
- `swap`: ??????
- `network_stats`: [Network stat](#network-statistic-data)

### Resource consuming statistic data

- `system_cpu_time`: the amount of time that the system has spent executing on system-level
- `user_cpu_time`: the amount of time that the system has spent executing on user-level
- `io_read`
- `io_write`
- `block_io_read`
- `block_io_write`

### Network statistic data

- `packet_stats`: [Packet statistics](#network-packet-statistics-data)
- `interface_stats`: A hash map [interface name] -> [Interface stat](#interface-statistic-data)

### Interface statistic data

- `iname`: Interface name
- `packet_stats`: [Packet statistics](#network-packet-statistics-data)

connection_stats: A hash map [Connection](#connection) -> [Connection stat](#connection-statistic-data)

### Connection

- `local_addr`
- `local_port`
- `remote_addr`
- `remote_port`
- `connection_type`: `TCP` || `UDP`,

### Connection statistic data

- `connection`: [Connection](#connection)
- `packet_stats`: [Packet statistics](#network-packet-statistics-data)

### Network packet statistics data

Packet count:

- `num_sent`
- `num_recv`

Data count in link layer:

- `data_sent`
- `data_recv`

Data count in higher network layer:

- `real_data_sent`
- `real_data_recv`
