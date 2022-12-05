# Swift CSV

This is a library to read/write csv files.

It contains;
- The Library, SwiftCSV
- A Sample commandline SwiftCSVCommandLine
- A couple of SwiftCSVTests

## Compiling for wasm

Execute `swift build --triple wasm32-unknown-wasi`

## Running the Sample command line

Go to `.build/debug/` and execute `wasmer SwiftCSVCommandLine.wasm`

### Prerequisites

- SwiftWasm Swift version 5.7.1 (swiftlang-5.7.1)
