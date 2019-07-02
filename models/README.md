# Power Desingner的使用

- 基础 <https://www.cnblogs.com/biehongli/p/6025954.html>
- 数据字典（表的结构） <https://blog.csdn.net/jyf0412/article/details/21900075>
- 数据流图
  - <https://blog.csdn.net/q547550831/article/details/47184997>
  - <https://jingyan.baidu.com/article/b87fe19e466ea752183568ca.html>
  - <https://www.cnblogs.com/faylz/articles/2958830.html>

## Power Designer在根据物理模型生成数据库时，可能出现的bug

PowerDesinger版本：16.5.5.0（试用）；DBMS：Oracle 11g

- 在生成触发器代码时，使用的双斜杠注释而不是使用双横杠注释；如`// DECLARATION`，实际应为`-- DECLARATION`。
- 在引用序列时，不自动对序列对象添加双引号，导致非全大写的序列不能被正确引用。如`IDSequence.NEXTVAL`实际应为`"IDSequence".NEXTVAL`。
- 有些生成的PL/SQL语句末尾没有分号，导致PL/SQL编译失败。

修正步骤：

1. 在“create or replace package PDTypes ... end;”语句之后插入`/`分割符。
2. 将所有`//`替换为`--`。
3. 将所有**大写的**`END`替换为`END;`。
4. 将所有的`IDSequence.NEXTVAL`替换为`"IDSequence".NEXTVAL`。

利用`crebas.amended.py`自动化上述过程。
