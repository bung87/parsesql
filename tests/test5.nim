discard """
  targets: "c js"
"""
import parsesql, unittest

resetOutputFormatters()
addOutputFormatter(newConsoleOutputFormatter(OutputLevel.PRINT_FAILURES))

suite "serial and sequnce":
  test "create serial":
    echo $parseSQL("CREATE TABLE tablename ( colname SERIAL);")
  test "create sequnce (equivalent to create serial)":
    echo $parseSQL("CREATE SEQUENCE tablename_colname_seq;")  
  test "ALTER sequnce":
    echo $parseSQL("ALTER SEQUENCE tablename_colname_seq OWNED BY tablename.colname;")

