discard """
  targets: "c js"
"""
import parsesql, unittest

resetOutputFormatters()
addOutputFormatter(newConsoleOutputFormatter(OutputLevel.PRINT_FAILURES))

suite "transaction":
  test "start":
    check $parseSQL("START TRANSACTION;") == "start transaction;"
  test "multi":
    const s = """
    START TRANSACTION;
    TRUNCATE TABLE table_name;
    ROLLBACK
    """
    check $parseSQL(s) == "start transaction; truncate table table_name; rollback;"

