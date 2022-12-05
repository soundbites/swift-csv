import Foundation
import SwiftCSV

func main() -> Int32 {
    let options = Arguments.options(from: CommandLine.arguments)

    switch (options.shouldRead, options.shouldWrite) {
    case (true, false):
        return read(options: options)
    case (false, true):
        return write(options: options)
    case (false, false), (true, true):
        print("Invalid arguments, either -\(Arguments.string.rawValue) <\"SOME CSV INPUT STRING\"> -\(Arguments.output.rawValue) <FILE> OR -\(Arguments.url.rawValue) <SOME URL TO A CSV> -delimiter <DELIMITER>")
        return 1
    }
}

func write(options: [Arguments: String]) -> Int32 {
    guard let delimiter = options[Arguments.delimiter]?.first,
          let string = options[Arguments.string],
          let csv = CSV(string: string, delimiter: delimiter),
          let output = options[Arguments.output] else {
        print("Invalid CSV contents supplied; \(options[Arguments.string] ?? "no-contents-found")")
        return 1
    }
    let writer = Writer(csv: csv)
    do {
        try writer.write(to: output)
        print("Written CSV")
        return 0
    } catch {
        print("Unable to write CSV, error; \(error.localizedDescription)")
        return 1
    }
}

func read(options: [Arguments: String]) -> Int32 {
    guard let delimiter = options[Arguments.delimiter]?.first,
          let urlString = options[Arguments.url],
          let url = URL(string: urlString)
    else {
        print("Invalid URL; \(options[Arguments.url] ?? "no-url-found")")
        return 1
    }
    do {
        let reader = Reader(url: url, delimiter: delimiter)
        let csv = try reader.read()
        print(csv.prettyPrint)
        return 0
    } catch {
        print("Unable to read CSV, error; \(error.localizedDescription)")
        return 1
    }
}

exit(main())
