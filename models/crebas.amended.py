import re

def main():
	sql = None
	
	with open("crebas.sql", "r") as src:
		sql = src.read()
		
		# 在“create or replace package PDTypes ... end;”语句之后插入`/`分割符。
		pattern = r'create or replace package PDTypes[\s\S]*?end;'
		match = re.search(pattern, sql)
		origin = match.group()
		sql = re.sub(pattern, origin + '\n/', sql)
		
		# 将所有`//`替换为`--`。
		sql = re.sub('//', '--', sql)
		
		# 将所有**大写的**`END`替换为`END;`。
		sql = re.sub('\sEND\s', 'END;', sql)
		
		# 将所有的`IDSequence.NEXTVAL`替换为`"IDSequence".NEXTVAL`。
		sql = re.sub('IDSequence.NEXTVAL', '"IDSequence".NEXTVAL', sql)
		
	with open("crebas.amended.sql", "w") as out:
		out.write(sql)


if __name__ == '__main__':
	main()
