#!/bin/bash

set -e

ESCAPED_ASPNETCORE_APP_DSN=$(printf '%s\n' "$ASPNETCORE_APP_DSN" | sed -e 's/[\/&]/\\&/g')
sed -e 's/<SENTRY_DSN>/'"$ESCAPED_ASPNETCORE_APP_DSN"'/g' appsettings.json.template > appsettings.json
sed -i '' 's/<HOST>/'$HOST'/g' appsettings.json
sed -i '' 's/<USERNAME>/'$USERNAME'/g' appsettings.json
ESCAPED_PASSWORD=$(printf '%s\n' "$PASSWORD" | sed -e 's/[\/&]/\\&/g')
sed -i '' 's/<PASSWORD>/'"$ESCAPED_PASSWORD"'/g' appsettings.json
sed -i '' 's/<DATABASE>/'$DATABASE'/g' appsettings.json

dotnet publish -c Release