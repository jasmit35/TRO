"""
categories.py - Data classes and methods for the categories table.
"""

from dataclasses import dataclass
from logging import getLogger

from function_logger import function_logger


@dataclass
class CategoriesData:
    category_id: int = 0
    category_name: str = ""
    category_type_fk: int = 0
    category_group_fk: int = 0
    _category_description: str = ""
    _category_hidden: bool = False

    def __str__(self) -> str:
        return f"CategoriesData[{self.category_id}, '{self.category_name}', {self.category_type_fk}, \
{self.category_group_fk}, '{self._category_description}', {self._category_hidden}]"

    def __init__(self, row):
        self._logger = getLogger()
        # If row is a list, add 0 as the first element and convert it to a tuple
        if row.__class__.__name__ == "list":
            row = [0] + row
            row = tuple(row)

        self._logger.debug(f"Begin 'CategoriesData.__init__' arguments - {row}")
        cols = len(row)
        self.category_id = row[0]
        self.category_name = row[1]
        if cols > 5:
            self._category_hidden = row[5]
        """
        if cols > 0 and row[0] is not None:
            self.category_id = row[0]
        if cols > 1 and row[1] is not None:
            self.category_name = row[1]
        if cols > 2:
            self.category_type_fk = 0  # row[2]
        if cols > 3:
            self.category_group_fk = 0  # row[3]
        if cols > 4 and row[4] is not None:
            self.category_description = row[4]
        if cols > 5:
            self._category_hidden = row[5]
        """
        self._logger.debug(f"End   'CategoriesData.__init__' returns - {self}")
        return None


class CategoriesTable:

    def __init__(self, db_conn):
        self._db_conn = db_conn
        self._logger = getLogger()

    def __str__(self) -> str:
        return "CategoriesTable"

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def select_id_using_name(self, cat_name):
        sql = """
            select category_id
            from tro.categories
            where category_name = %s
        """
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql, (cat_name,))
            results = cursor.fetchone()
            # self._logger.debug(f"    {results=}")

            category_id = None
            if results is not None:
                category_id = results[0]

        return category_id

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def insert_name(self, name):
        sql = """
            insert into tro.categories
            (category_name)
            values (%s)
        """
        with self.db_conn.cursor() as cursor:
            cursor.execute(sql, (name,))

        category_id = self.select_by_name(name)

        return category_id

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def insert_row(self, category_data):
        sql = """
            insert into tro.categories
            (category_name, category_type_fk, category_group_fk)
            values (%s, %s, %s)
        """
        with self._db_conn.cursor() as cursor:
            rc = cursor.execute(
                sql,
                (
                    category_data.category_name,
                    category_data.category_type_fk,
                    category_data.category_group_fk,
                ),
            )

        return rc

    # ---------------------------------------------------------------------------------------------------------------------
    '''
    @function_logger
    def update_using_id(self, category_id, new_row):
        sql = """
            select * from tro.categories
            where category_id = %s
       """
        with self.db_conn.cursor() as cursor:
            cursor.execute(sql, (category_id,))
            existing_row = CategoriesData(cursor.fetchone())

            rc = self._update_using_row(existing_row)
            return rc
   '''

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def update(self, new_row):
        sql = """
            select * from tro.categories
            where category_id = %s
       """
        existing_row = None
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql, (new_row.category_id,))
            existing_row = CategoriesData(cursor.fetchone())
            self._logger.debug(f"     {existing_row=}")

        perform_update = False
        if existing_row.category_name != new_row.category_name:
            perform_update = True
            self.report("    changing '{existing_row.category_name}' to '{new_row.category_name}'")

        if existing_row.category_type_fk != new_row.category_type_fk:
            perform_update = True
            self._logger.info("    changing '{existing_row.category_type_fk}' to '{new_row.category_type_fk}'")

        if existing_row.category_group_fk != new_row.category_group_fk:
            perform_update = True
            self._logger.info("    changing '{existing_row.category_group_fk}' to '{new_row.category_group_fk}'")

        if perform_update:
            sql = """
                update tro.categories
                    set category_name = %s,
                        category_type_fk = %s,
                        category_group_fk = %s
                where category_id = %s
             """
            with self._db_conn.cursor() as cursor:
                cursor.execute(
                    sql,
                    (
                        new_row.category_name,
                        new_row.category_type_fk,
                        new_row.category_group_fk,
                        new_row.category_id,
                    ),
                )

        return perform_update

    # ---------------------------------------------------------------------------------------------------------------------
    def delete_by_id(self, category_id):
        sql = """
            delete from tro.categories
            where category_id = %s
        """
        with self.db_conn.cursor() as cursor:
            cursor.execute(sql, (category_id,))
            rows_deleted = cursor.rowcount

        return rows_deleted

    # ---------------------------------------------------------------------------------------------------------------------
    @function_logger
    def truncate(self):
        sql = """
            truncate tro.categories;
            select setval('tro.categories_category_id_seq', 1);
        """
        self._logger.debug(f"    {self._db_conn=}")
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql)

    # ---------------------------------------------------------------------------------------------------------------------
    def get_row_count(self):
        sql = """
            select count(*) from tro.categories;
        """
        with self._db_conn.cursor() as cursor:
            cursor.execute(sql)
            row_count = cursor.fetchone()[0]

        return row_count
