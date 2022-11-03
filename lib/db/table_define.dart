class DSTableDefine {
  static const String threeOneTable = 'threeOneTable';
  static const String historyFundsTable = 'historyFundsTable';
  /*
    存储类             描述
     
    NULL              值是一个 NULL 值。
    
    INTEGER           值是一个带符号的整数，-2^63 到 2^63 - 1
    
    REAL              值是一个数字类型，dart中的 num
    
    TEXT              值是一个文本字符串，dart中的 String
    
    BLOB              值是一个 blob 数据，dart中的 Uint8List 或者 List<int> 

    */
  createThreeOneTable() {
    return '''
      CREATE TABLE IF NOT EXISTS $threeOneTable (
        "id"    INTEGER NOT NULL PRIMARY KEY,
        "fm"    TEXT,
        "h"  TEXT,
        "hs" TEXT,
        "lb" TEXT,
        "l" TEXT,
        "lt" TEXT,
        "o" TEXT,
        "pe" TEXT,
        "pc" TEXT,
        "p" TEXT,
        "sz" TEXT,
        "cje" TEXT,
        "ud" TEXT,
        "v" TEXT,
        "yc" TEXT,
        "zf" TEXT,
        "zs" TEXT,
        "sjl" TEXT,
         "zdf60" TEXT,
        "zdfnc" TEXT,
        "t" TEXT
      );
      ''';
  }

  createHistroyFundsTable() {
    return '''
      CREATE TABLE IF NOT EXISTS $historyFundsTable (
        "id" INTEGER NOT NULL PRIMARY KEY,
        "t"  TEXT,
        "c"  TEXT,
        "zdf" TEXT,
        "jlrl" TEXT,
        "hsl" TEXT,
        "qbjlr" TEXT,
        "cddlr" TEXT,
        "cddjlr" TEXT,
        "ddlr" TEXT,
        "ddjlr" TEXT,
        "xdlr" TEXT,
        "xdjlr" TEXT,
        "sdlr" TEXT,
        "sdjlr" TEXT
      );
      ''';
  }


 

  /*
{
    "fm": "0.07", 
    "h": "14.84",  //最高价
    "hs": "0.66", //换手率
    "lb": "1.00", 
    "l": "14.50",  //最低价
    "lt": "124606935631.00", 
    "o": "14.50", 开盘价
    "pe": "23.72", ///市盈率
    "pc": "2.08",  //涨幅百分比
    "p": "14.71", //当前价
    "sz": "124936237369.00", //总市值
    "cje": "815744942.00", //成交额
    "ud": "0.30", //涨幅
    "v": "555923",  //成交量
    "yc": "14.41", 
    "zf": "2.36", 
    "zs": "0.00", 
    "sjl": "1.99", 
    "zdf60": "-18.73", 
    "zdfnc": "-34.18", 
    "t": "2022-10-26 15:18:07"
}
  */

}
