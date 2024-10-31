# FHIR Package Loader

FHIR Package Loader is a utility that downloads published FHIR packages from the FHIR package registry.

# Usage

This tool can be used directly through a command line interface (CLI) or it can be used as a dependency in another JavaScript/TypeScript project to download FHIR packages and load the contents into memory.

FHIR Package Loader requires [Node.js](https://nodejs.org/) to be installed on the user's system. Users should install Node.js 18, although other current LTS versions are also expected to work.

Once Node.js is installed, use either of the following methods to use the FHIR Package Loader.

## Command Line

To download and unzip FHIR packages through the command line, you can run the following command directly:

```sh
npx fhir-package-loader install <package@version...> # downloads specified FHIR packages
```

_Note: `npx` comes with npm 5.2+ and higher._

`npx` will ensure you are using the latest version and will allow you to run the CLI without needing to install and manage any dependency.

Alternatively, if you'd like to install the package, it can be installed globally and used as follows:

```sh
npm install -g fhir-package-loader # installs the package from npm
```

After installation, the `fhir-package-loader` command line will be available on your path:

```sh
fpl --help # outputs information about using the command line
fpl install --help

fpl install <package@version...> # downloads specified FHIR packages
```

With both approaches, the same commands are available. The install command allows you to specify the FHIR packages to download, along with a few additional options:

```sh
Usage: fpl install <fhirPackages...> [options]

download and unzip specified FHIR packages

Arguments:
  fhirPackages      list of FHIR packages to load using the format packageId@packageVersion...

Options:
  -c, --cachePath <dir>  where to save packages to and load definitions from (default is the local [FHIR cache](https://confluence.hl7.org/pages/viewpage.action?pageId=66928417#FHIRPackageCache-Location))
  -d, --debug       output extra debugging information
  -h, --help        display help for command
```

General information about any command can be found with `fpl --help`:

```sh
Usage: fpl [options] [command]

CLI for downloading FHIR packages

Options:
  -v, --version                        output the version number
  -h, --help                           display help for command

Commands:
  install [options] <fhirPackages...>  download and unzip specified FHIR packages
  help [command]                       display help for command

Examples:
  fpl install hl7.fhir.us.core@current
  fpl install hl7.fhir.us.core@4.0.0 hl7.fhir.us.mcode@2.0.0 --cachePath ./myProject
```

## API

Additionally, FHIR Package Loader exposes functions that can be used to query and download packages.

### fpl(fhirPackages[, options])

The `fpl` function can be used to download FHIR packages and load their definitions.

#### Parameters

`fhirPackages` - An array of strings (or a comma separated string) that specifies the FHIR packages and versions to load. These can be in the format of `package#version` or `package@version`.

- For example: `'hl7.fhir.us.core@4.0.0, hl7.fhir.us.mcode@2.0.0'` or `['hl7.fhir.us.core@4.0.0', 'hl7.fhir.us.mcode@2.0.0']`

`options` - An object which can have the following attributes:

- `cachePath` - A string that specifies where to look for already downloaded packages and download them to if they are not found. The default is the the local [FHIR cache](https://confluence.hl7.org/pages/viewpage.action?pageId=66928417#FHIRPackageCache-Location).

- `log` - A function that is responsible for logging information. It takes in two strings, a level and a message, and does not return anything.
  - For example: `log: console.log` will pass in `console.log` as the logging function and the level and message will be logged as `console.log(level, message)`

#### Return Value

A `Promise` that resolves to an object with the following attributes:

- `defs` - A [`FHIRDefinitions`](./src/FHIRDefinitions.ts) class instances that contains any definitions loaded from the specified package(s).
- `errors` An array of strings containing any errors detected during package loading.
- `warnings` An array of strings containing any warnings detected during package loading.
- `failedPackages` An array of strings containing the `package#version` of any packages that encountered an error during download or load and were not properly loaded to `defs`.

### getLatestVersion(packageName[, log])

The `getLatestVersion` function can be used to query the latest version of a FHIR package.

#### Parameters

`packageName` - A string that specifies the FHIR package to query.

`log` - A function that is responsible for logging information. It takes in two strings, a level and a message, and does not return anything.

#### Return Value

A `Promise` that resolves to a string containing the latest version of the FHIR package.

### Usage

To use the API, FHIR Package Loader must be installed as a dependency of your project. To add it as a dependency, navigate to your project directory and use `npm` to install the package:

```sh
cd myProject
npm install fhir-package-loader
```

Once installed as a dependency, you can `import` and use the API for loading FHIR packages. This function provides the same functionality you get through the CLI, but you also have access to the in memory definitions from the packages. The following example shows two ways to use the function in a project:

```javascript
import { fpl } from 'fhir-package-loader';

async function myApp() {
  // Downloads and unzips packages to FHIR cache or other specified location (if not already present)
  await fpl(['package@version, package2@version'])
    .then(results => {
      // handle results
    })
    .catch(err => {
      // handle thrown errors
    });

  // Similar to above, but uses options
  await fpl(['package@version'], {
    cachePath: '../myPackages',
    log: console.log
  })
    .then(results => {
      // handle results
    })
    .catch(err => {
      // handle thrown errors
    });
}
```

## Mock Out in Unit Tests

If you use `fhir-package-loader` as a dependency in your project, you can choose to mock any function from the package. This may be helpful for writing unit tests that do not need to download packages from the FHIR registry. One way to do this is using the following snippet:

```javascript
jest.mock('fhir-package-loader', () => {
  const original = jest.requireActual('fhir-package-loader');
  return {
    ...original,
    loadDependencies: jest.fn(), // can optionally include a mock implementation
    // any other functions to be mocked out
  }
}
```

# For Developers

## Installation

FHIR Package Loader is a [TypeScript](https://www.typescriptlang.org/) project. At a minimum, it requires [Node.js](https://nodejs.org/) to build, test, and run the CLI. Developers should install Node.js 18, although other current LTS versions are also expected to work.

Once Node.js is installed, run the following command from this project's root folder:

```sh
npm install
```

## Exposed functions

While the CLI and API should be sufficient for the majority of use cases, FHIR Package Loader exposes a few additional functions and classes that can be used within JavaScript/TypeScript projects. Below are the key exports:

| Export             | Description                                                                                                                                                                                                                                |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `fpl`              | API function to download and load definitions for a provided list of packages.                                                                                                                                                             |
| `getLatestVersion` | API function to find the latest version of a package.                                                                                                                                                                                      |
| `loadDependencies` | Takes a list of FHIR packages, a path to a directory (optional, defaults to FHIR cache), a log function (optional) and returns FHIRDefinitions from the provided packages.                                                                 |
| `mergeDependency`  | Takes a package name, a package version, an instance of FHIRDefinitions, a path to a directory (optional, defaults to FHIR cache), a log function (optional) and returns FHIRDefinitions with definitions added directly from the package. |
| `loadFromPath`     | Takes a path, a package and version (format: package#version), and an instance of FHIRDefinitions and loads the definitions from the provided package at the provided path into FHIRDefinitions.                                           |
| `FHIRDefinitions`  | A class for FHIRDefinitions for one or more packages. This could be extended if there are additional properties that are specific to your implementation.                                                                                  |

# License

Copyright 2022 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
