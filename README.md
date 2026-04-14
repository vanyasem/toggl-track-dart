# toggl_track

A simple CLI client for the [Toggl Track](https://toggl.com/track/) Reports API. Shows hours worked per project and workspace for a given month.

## Example output

```sh
$ dart run toggl_track 3 2025
Fetching data for 2025-03-01 to 2025-03-31

--- Workspace: 123 ---
  Project 666: 8.68h
  Project 1337: 39.70h
  Total: 48.37h

--- Workspace: 456 ---
  Project 69: 12.78h
  Project 6969: 11.40h
  Total: 24.18h
```

## Prerequisites

- [Dart SDK](https://dart.dev/get-dart) >= 3.11.0
- A Toggl Track account

## Setup

1. Clone the repository
2. Copy `.env.example` to `.env` and fill in your credentials:

```env
TOGGLUSERNAME=your@email.com
TOGGLPASSWORD=yourpassword
WORKSPACES=123,456
USER_ID=789
```

- `WORKSPACES` is a comma-separated list of workspace IDs
- `USER_ID` is your Toggl user ID (used to filter time entries)

3. Install dependencies:

```sh
dart pub get
```

## Usage

```sh
dart run toggl_track <month> [year]
```

- `month` - month number (1-12), required
- `year` - optional, defaults to the current year

## License

[GPL-3.0](LICENSE)
