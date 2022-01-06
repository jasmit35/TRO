"""
categories
"""


class CategoriesTable:
    def __init__(self, db_conn) -> None:
        self.db_conn = db_conn
        self.buffered_categories = {}
        self.load_existing()

    def load_existing(self):
        sql = """
            select category_name, category_id
            from tro.categories
        """
        with self.db_conn.cursor() as cursor:
            cursor.execute(sql)
            results = cursor.fetchall()
        self.buffered_categories = dict(results)

    def get_id(self, cat_name, insert_missing=True):
        category_id = self.buffered_categories.get(cat_name)
        if insert_missing is True:
            if category_id is None:
                category_id = self.select_id(cat_name)
                if category_id is None:
                    category_id = self.insert_category(cat_name)
                self.buffered_categories[cat_name] = category_id

        return category_id

    def select_id(self, cat_name):
        sql = """
            select category_id
            from tro.categories
            where category_name = %s
        """
        with self.db_conn.cursor() as cursor:
            cursor.execute(sql, (cat_name,))
            results = cursor.fetchone()
            if results is None:
                category_id = None
            else:
                category_id = results[0]
        return category_id

    def insert_category(self, name):
        sql = """
            insert into tro.categories (category_name, category_type_fk, category_group_fk)
            values (%s, %s, %s)
        """
        with self.db_conn.cursor() as cursor:
            cursor.execute(sql, (name, 0, 0))

        category_id = self.select_id(name)
        return category_id
