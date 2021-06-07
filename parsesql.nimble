# Package

version       = "0.1.1"
author        = "bung87"
description   = "The parsesql module implements a high performance SQL file parser. It parses PostgreSQL syntax and the SQL ANSI standard."
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.4.0"

task test, "Runs the test suite":
  exec """testament --megatest:off pattern 'tests/*.nim' """