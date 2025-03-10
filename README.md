# CleverV - a Clever Cloud CLI in V

CleverV is a Command Line Interface (CLI) to interact with the Clever Cloud API with API Tokens, written in V.

## Installation

### Prerequisites

- [V](https://vlang.io/) installed on your system
- A Clever Cloud account and an API token

### Building

```bash
v .
```

## Configuration

Before using CleverV, you need to configure your Clever Cloud API token:

```bash
export CLEVER_API_TOKEN="your_api_token"
```

## Usage

### Available Commands

#### Display Help

```bash
./cleverv help
```

#### Display Your Profile

```bash
./cleverv profile
```

Options:
- `-f, --format`: Output format (default or json)
  ```bash
  ./cleverv profile --format json
  ```

#### Display Your Account Summary

```bash
./cleverv summary
```

## Development

The project is organized in modules:

- `clever/`: Main module
  - `client.v`: HTTP client and request handling
  - `user.v`: User-related endpoints

- `commands/`: CLI commands
  - `profile.v`: Command to display profile
  - `summary.v`: Command to display summary

## License

This project is under MIT license.
