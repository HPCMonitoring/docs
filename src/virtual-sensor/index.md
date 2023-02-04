# Virtual Sensor

Virtual sensor descriptions.

## Data collection

### Payload's content interfaces

```typescript
interface Process {
    pid: number
    parentPid: number
    uid: number
    effectiveUid: number
    gid: number
    effectiveGid: number
    executePath: string
    command: string
    memoryUsage: number // In KB
    cpuTime: number
    cpuUtilization: number // In %
    networkInBandwidth: number // What interface ???
    networkOutBandwidth: number
    ioWrite: number // In KB
    ioRead: number // In KB
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

## Helpful tools

Some useful command lines:

- `sysstat`
- `df`
- `free`
