# Virtual Sensor

Virtual sensor descriptions.

## Helpful libraries

- [JSON in modern C++](https://github.com/nlohmann/json)
- [Boost C++ Libraries](https://www.boost.org/)
- [Kafka Client](https://docs.confluent.io/kafka-clients/librdkafka/current/overview.html)

## Data collection

### Payload's content interfaces

```typescript
interface Process {
    name: string;
    pid: number
    parentPid: number
    uid: number
    gid: number
    executePath: string
    command: string
    virtualMemoryUsage: number  // In KB
    physicalMemoryUsage: number // In KB
    cpuTime: number             // In ms
    cpuUsage: number            // In %
    networkInBandwidth: number  // What interface ???
    networkOutBandwidth: number
    ioWrite: number             // In KB
    ioRead: number              // In KB
}

interface NetworkInterface {
    name: string
    inBandwidth: number
    outBandwidth: number
}

interface Memory {
    used: number
    available: number
    swapUsed?: number
    swapFree?: number
}

interface Cpu {
    user: number
    nice: number
    system: number
    iowait: number
    steal: number
    idle: number
}

interface IOUsage {
    deviceName: string
    readPerSecond: number
    writePerSecond: number
}

interface DiskUsage {
    filesystemName: string
    used: number // In KB
    available: number // In KB
}
```

### Full payload interface

```typescript
interface KafkaMessage {
    nodeId: number
    timestamp: number
    payload: Process[] | NetworkInterface[] | Memory | Cpu | IOUsage | DiskUsage
    type: 'PROCESS' | 'NETWORK_INTERFACE' | 'MEMORY' | 'CPU' | 'IO_USAGE' | 'DISK_USAGE'
}
```

### Data in namespace

Note that a process runs in container such as `Docker`, `LXC` ... or runs in a VM has its own namespace.

### Sample data from `/proc/$PID/net/dev` file

|Interface name   |Receive ||||||| |Transmit ||||||| |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|   |bytes|packets|errs|drop|fifo|frame|compressed|multicast|bytes|packets|errs|drop|fifo|colls|carrier|compressed|
|lo|2469224|19558|0|0|0|0|0|0|2469224|19558|0|0|0|0|0|0|

## Helpful tools

Some useful command lines:

- `sysstat`
- `df`
- `free`

## Build `systemd` service

<https://www.tecmint.com/create-systemd-service-linux/>
