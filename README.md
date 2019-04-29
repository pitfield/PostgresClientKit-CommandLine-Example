# PostgresClientKit-CommandLine-Example

Demonstrates use of [PostgresClientKit](https://github.com/codewinsdotcom/PostgresClientKit) in a command-line application.

This is a basic, but complete, example of how to connect to Postgres, perform a SQL `SELECT` command, and process the resulting rows.  It uses the `weather` table in the [Postgres tutorial](https://www.postgresql.org/docs/11/tutorial-table.html).

## Using

Use `psql` to create the `weather` table and insert a few rows.

```
CREATE TABLE weather (
    city            varchar(80),
    temp_lo         int,           -- low temperature
    temp_hi         int,           -- high temperature
    prcp            real,          -- precipitation
    date            date
);

INSERT INTO weather
    VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
    VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');
    
INSERT INTO weather (date, city, temp_hi, temp_lo)
    VALUES ('1994-11-29', 'Hayward', 54, 37);
```

Set the following properties in `main.swift` to values appropriate for your environment:

- `configuration.host`
- `configuration.port`
- `configuration.ssl`
- `configuration.database`
- `configuration.user`
- `configuration.credential`

Then, in a shell:

```
cd <path-to-clone>
swift package clean
swift build
swift run
```

Output:

```
San Francisco on 1994-11-27: low: 46, high: 50, precipitation: Optional(0.25)
San Francisco on 1994-11-29: low: 43, high: 57, precipitation: Optional(0.0)
```
