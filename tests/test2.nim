discard """
  targets: "c js"
"""
import parsesql, unittest

resetOutputFormatters()
addOutputFormatter(newConsoleOutputFormatter(OutputLevel.PRINT_FAILURES))
suite "misc":
  test "commit":
    check $parseSQL("commit;") == "commit;"
  test "rollback":
    check $parseSQL("ROLLBACK;") == "rollback;"
  test "DESC":
    check $parseSQL("DESC table_name;") == "desc table_name;"
  test "TRUNCATE":
    check $parseSQL("TRUNCATE TABLE table_name;") == "truncate table table_name;"
