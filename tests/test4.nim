discard """
  targets: "c js"
"""
import parsesql, unittest

resetOutputFormatters()
addOutputFormatter(newConsoleOutputFormatter(OutputLevel.PRINT_FAILURES))
# https://dev.mysql.com/doc/refman/8.0/en/numeric-type-syntax.html
# https://www.postgresql.org/docs/9.3/datatype-numeric.html#DATATYPE-NUMERIC-TABLE
suite "numberic":
  test "bit":
    check $parseSQL("create table tbl1(a bit);") == "create table tbl1(a  bit );"
  test "bit":
    check $parseSQL("create table tbl1(a bit(64));") == "create table tbl1(a  bit );"
  test "tinyint":
    check $parseSQL("create table tbl1(a tinyint);") == "create table tbl1(a  tinyint );"
    check $parseSQL("create table tbl1(a tinyint(3) unsigned);") == "create table tbl1(a  tinyint unsigned );"
  test "tinyint":
    check $parseSQL("create table tbl1(a tinyint(3) zerofill);") == "create table tbl1(a  tinyint zerofill );"
  test "bool":
    check $parseSQL("create table tbl1(a bool);") == "create table tbl1(a  bool );"
    check $parseSQL("create table tbl1(a boolean);") == "create table tbl1(a  boolean );"
  test "smallint":
    check $parseSQL("create table tbl1(a smallint(3) unsigned zerofill);") == "create table tbl1(a  smallint unsigned zerofill );"
    check $parseSQL("create table tbl1(a smallint(3) zerofill unsigned);") == "create table tbl1(a  smallint zerofill unsigned );"
  test "integer":
    check $parseSQL("create table tbl1(a INTEGER(3));") == "create table tbl1(a  integer );"
  test "bigint":
    check $parseSQL("create table tbl1(a bigint(3));") == "create table tbl1(a  bigint );"
  test "decimal": # SERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.
    check $parseSQL("create table tbl1(a DECIMAL(3));") == "create table tbl1(a  decimal );"
  test "dec":
    check $parseSQL("create table tbl1(a dec(3));") == "create table tbl1(a  dec );"
  test "fixed":
    check $parseSQL("create table tbl1(a fixed(3));") == "create table tbl1(a  fixed );"
  test "float":
    check $parseSQL("create table tbl1(a float(3));") == "create table tbl1(a  float );"
  test "double":
    check $parseSQL("create table tbl1(a double(3));") == "create table tbl1(a  double );"
  test "double precision":
    check $parseSQL("create table tbl1(a DOUBLE PRECISION(3));") == "create table tbl1(a  double precision );"
  test "real":
    check $parseSQL("create table tbl1(a real);") == "create table tbl1(a  real );"
  test "NOT NULL DEFAULT nextval":
    const s = """
      CREATE TABLE tablename (
          colname integer NOT NULL DEFAULT nextval('tablename_colname_seq')
      );
      
      """
    discard $parseSQL(s)
  

