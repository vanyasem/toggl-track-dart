# Implementation plan

## Stage 1

Use Dart MCP. Use context7 MCP.

When the plan is ready, wait for my explicit approval before executing the task.
Ask me clarifying questions about the task.

I need a simple CLI client for Toggl Track API that would show the amount of hours worked in the specified month (by month number) for all workspaces separately.

API's URL is `api.track.toggl.com`.

The endpoint is `/reports/api/v3/workspace/toggl_workspace_id/projects/summary`, where `toggl_workspace_id` should be replaced with workspace ID. Workspace IDs should be read from @.env. It takes the following arguments: `{"start_date":"2026-04-01","end_date":"2026-04-30"}`.

It needs authorization via Toggl Track's username and password. Read them from @.env.

At this stage, only print the raw JSON output to the console.

## Stage 2

Use Dart MCP. Use context7 MCP.

When the plan is ready, wait for my explicit approval before executing the task.
Ask me clarifying questions about the task.

The output of the endpoint implemented in Stage 1 looks like this: `[{"user_id":789,"project_id":123,"tracked_seconds":1234},{"user_id":789,"project_id":456,"tracked_seconds":1234}]`

Remove the raw output of JSON, and instead only output `tracked_seconds` converted to hours in a human-readible format. First, output the hours for each individual project_id, then output the total amount of hours. Make sure to only count `tracked_seconds` by a specific `user_id`. Read `USER_ID` from @.env
