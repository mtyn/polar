import Foundation
import ShellOut

/*
Steps for each implementation:
1. Clone the relevant Nord template theme
2. For each theme
    a. Copy across the necessary theme files to the repository
    b. Find and replace the normal colors with our replacement colors
    c. Apply any post-processing to customise individual values
3. Cleanup the temporary Nord clone
*/

@available(macOS 13.0, *)
@main
public struct Generator {
    static let temporaryClonedFileDirectory = ".tempGenerationFiles"
    static let version = "2.0.0"

    /**
    Note: This is hard coded because it's always this path on my Mac. As I'm the main user
    of this generator, this is fine for me. If you're using the generator outside my environment,
    you may wish to update this path to somewhere else if that's where this repo is.
    */
    static let baseURL = URL(filePath: "../", directoryHint: .isDirectory)

    static let portsToGenerate: [Port] = [
        VSCode(),
        XCode(),
        JetBrains()
    ]
    
    static let themes: [PolarColorScheme] = [
        PolarColorScheme()
    ]

    public static func main() {
        let workingDirectory = Generator.baseURL
        print("POLAR: Generating Polar themes...")
        do {
            let tempDirectory = try prepareTemporaryDirectory()
            try portsToGenerate.forEach { port in 
                print("POLAR: Porting \(port.directory)")
                let portGitUrl = try prepareNordPort(basePath: tempDirectory, port: port)
                try copyAndUpdateNecessaryFiles(port: port, basePath: workingDirectory, sourcePath: portGitUrl)
            }
        } catch {
            print("POLAR: ERROR: Failed to run the generator because \(error)")
        }
    }
    
    // MARK: - Helper Methods

    static func prepareTemporaryDirectory() throws -> URL {
        let tempDirectory = Generator.baseURL.appending(component: temporaryClonedFileDirectory)
        if FileManager.default.fileExists(atPath: tempDirectory.path()) {
            print("POLAR: Existing generator files detecting, cleaning...")
            try FileManager.default.removeItem(at: tempDirectory)
        } 
        print("POLAR: Creating temporary working directory for Nord clones...")
        try FileManager.default.createDirectory(at: tempDirectory, withIntermediateDirectories: true)
        return tempDirectory
    }

    static func prepareNordPort(
        basePath: URL,
        port: Port
    ) throws -> URL {
        let outputDirectory = basePath.appending(component: port.directory)
        print("POLAR: - Cloning Nord port for \(port.directory)")
        print("POLAR: - Cloning from \(port.nordGitUrl)")
        try shellOut(to: .gitClone(url: URL(string: port.nordGitUrl)!, to: basePath.appending(component: port.directory).path()))
        return outputDirectory
    }
    
    static func copyAndUpdateNecessaryFiles(
        port: Port,
        basePath: URL,
        sourcePath: URL
    ) throws {
        for theme in Generator.themes {
            print("POLAR: - Writing \(theme.title) for \(port.directory)")
            for component in port.relevantComponents {
                switch component {
                case .file(let path, let renameTo):
                    try processFile(
                        theme: theme,
                        port: port,
                        filePathInNordTheme: path,
                        destination: convertName(renameTo, forTheme: theme),
                        basePath: basePath,
                        nordPath: sourcePath
                    )
                case .directory(let path, let renameTo):
                    print("POLAR: ERROR: Failed to parse directory as it hasn't been implemented yet")
                }
            }
        }

    }
    
    static func processFile(
        theme: PolarColorScheme,
        port: Port,
        filePathInNordTheme: String,
        destination: String,
        basePath: URL,
        nordPath: URL
    ) throws {
        let sourceFileURL = nordPath.appending(component: filePathInNordTheme)
        let destinationFileURL = basePath
            .appending(component: theme.folderName)
            .appending(component: port.directory)
            .appending(component: destination, directoryHint: .notDirectory)
        
        print("POLAR: -- Polarifying \(sourceFileURL)")
        
        let fileContent = try String(contentsOf: sourceFileURL, encoding: .utf8)
        let processedFileContent = convertFileToPolar(fileContent: fileContent, colorScheme: theme, port: port)
        
        try processedFileContent.write(to: destinationFileURL, atomically: true, encoding: .utf8)
        
        print("POLAR: --- Success")
    }
    
    static func convertName(_ name: String, forTheme theme: PolarColorScheme) -> String {
        name.replacingOccurrences(of: "<<THEME_NAME>>", with: theme.title)
    }
}
