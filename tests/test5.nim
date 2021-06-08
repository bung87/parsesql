discard """
  targets: "c js"
"""
import parsesql, unittest

resetOutputFormatters()
addOutputFormatter(newConsoleOutputFormatter(OutputLevel.PRINT_FAILURES))

suite "serial and sequence":
  test "create serial":
    echo $parseSQL("CREATE TABLE tablename ( colname SERIAL);")
  test "create sequence (equivalent to create serial)":
    echo $parseSQL("CREATE SEQUENCE tablename_colname_seq;")  
  test "create sequence":
    echo $parseSQL("""CREATE SEQUENCE order_item_id
    START 10
    INCREMENT 10
    MINVALUE 10
    OWNED BY order_details.item_id;
    """)
  test "create temp sequence":
    echo $parseSQL("""CREATE TEMP SEQUENCE IF NOT EXISTS order_item_id
    START 10
    INCREMENT 10
    MINVALUE 10
    OWNED BY order_details.item_id;
    """)
  # test "ALTER sequnce":
  #   echo $parseSQL("ALTER SEQUENCE tablename_colname_seq OWNED BY tablename.colname;")

